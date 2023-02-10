/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick                  2.12
import QtQuick.Controls         2.4
import QtQuick.Dialogs          1.3
import QtQuick.Layouts          1.12

import QtLocation               5.3
import QtPositioning            5.3
import QtQuick.Window           2.2
import QtQml.Models             2.1

import QGroundControl               1.0
import QGroundControl.Airspace      1.0
import QGroundControl.Airmap        1.0
import QGroundControl.Controllers   1.0
import QGroundControl.Controls      1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.Palette       1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Vehicle       1.0

// To implement a custom overlay copy this code to your own control in your custom code source. Then override the
// FlyViewCustomLayer.qml resource with your own qml. See the custom example and documentation for details.
Item {
    id: _root

    property var parentToolInsets               // These insets tell you what screen real estate is available for positioning the controls in your overlay
    property var totalToolInsets:   _toolInsets // These are the insets for your custom overlay additions
    property var mapControl

    property var activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    property var pkMapItem
    property var mapItems: []

    QGCToolInsets {
        id:                         _toolInsets
        leftEdgeCenterInset:    0
        leftEdgeTopInset:           0
        leftEdgeBottomInset:        0
        rightEdgeCenterInset:   0
        rightEdgeTopInset:          0
        rightEdgeBottomInset:       0
        topEdgeCenterInset:       0
        topEdgeLeftInset:           0
        topEdgeRightInset:          0
        bottomEdgeCenterInset:    0
        bottomEdgeLeftInset:        0
        bottomEdgeRightInset:       0
    }

    Component {
        id: myMapItemComponent

        MapQuickItem {
            id:             mapQuickItem
            anchorPoint.x:  dragHandle.width / 2
            anchorPoint.y:  dragHandle.height / 2
            z:              QGroundControl.zOrderMapItems + 2
            property alias mcdlLabel : mcdlLabel.text

            sourceItem: Rectangle {
                id:         dragHandle
                width:      ScreenTools.defaultFontPixelHeight * 2
                height:     width
                radius:     width / 2
                color:      "white"
                opacity:    .90
                Label {
                    id:         mcdlLabel
                    text:       ""
                    width:      ScreenTools.defaultFontPixelHeight * 1.2
                    height:     width
                    font.pixelSize:  ScreenTools.defaultFontPixelHeight * 0.6
                    topPadding: 4
                    leftPadding: 4
                }
            }
        }
    }

    //Add point at the drone's current location
    QGCButton {
        id: mcdlButton
        anchors.right:      clearButton.left
        anchors.bottom:     parent.bottom
        anchors.margins:    ScreenTools.defaultFontPixelWidth / 2
        text: qsTr("MCDL") //Mark Current Drone Location
        onClicked: {
            var myMapItem = myMapItemComponent.createObject(mapControl)
            myMapItem.coordinate = globals.activeVehicle.coordinate
            myMapItem.mcdlLabel = globals.activeVehicle.coordinate.latitude + "\n" + globals.activeVehicle.coordinate.longitude
            mapControl.addMapItem(myMapItem)
            mapItems.push(myMapItem)
        }
    }

    QGCButton {
        id: clearButton
        anchors.right:       parent.right
        anchors.bottom:        parent.bottom
        anchors.margins: ScreenTools.defaultFontPixelWidth / 2
        text: qsTr("Clear MCDL")
        onClicked: {
            for(var i = 0; i < mapItems.length; i++){
                mapControl.removeMapItem(mapItems[i])
            }
            for(var j = 0; j < mapItems.length; j++){
                mapItems.pop();
            }
        }
    }
}

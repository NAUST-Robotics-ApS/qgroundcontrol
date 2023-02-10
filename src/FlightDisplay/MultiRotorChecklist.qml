/****************************************************************************
 *
 *   (c) 2009-2016 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick                      2.11
import QtQuick.Controls             2.4
import QtQml.Models                 2.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.FlightDisplay 1.0
import QGroundControl.Vehicle       1.0

Item {
    property var model: listModel
    PreFlightCheckModel {
        id:     listModel
//        PreFlightCheckGroup {
//            name: qsTr("Multirotor Initial Checks")

//            PreFlightCheckButton {
//                name:           qsTr("Hardware")
//                manualText:     qsTr("Props mounted and secured?")
//            }

//            PreFlightBatteryCheck {
//                failurePercent:                 40
//                allowFailurePercentOverride:    false
//            }

//            PreFlightSensorsHealthCheck {
//            }

//            PreFlightGPSCheck {
//                failureSatCount:        9
//                allowOverrideSatCount:  true
//            }

//            PreFlightRCCheck {
//            }
//        }

//        PreFlightCheckGroup {
//            name: qsTr("Please arm the vehicle here")

//            PreFlightCheckButton {
//                name:            qsTr("Motors")
//                manualText:      qsTr("Propellers free? Then throttle up gently. Working properly?")
//            }

//            PreFlightCheckButton {
//                name:           qsTr("Mission")
//                manualText:     qsTr("Please confirm mission is valid (waypoints valid, no terrain collision).")
//            }

//            PreFlightSoundCheck {
//            }
//        }

//        PreFlightCheckGroup {
//            name: qsTr("Last preparations before launch")

//            // Check list item group 2 - Final checks before launch
//            PreFlightCheckButton {
//                name:           qsTr("Payload")
//                manualText:     qsTr("Configured and started? Payload lid closed?")
//            }

//            PreFlightCheckButton {
//                name:           qsTr("Wind & weather")
//                manualText:     qsTr("OK for your platform?")
//            }

//            PreFlightCheckButton {
//                name:           qsTr("Flight area")
//                manualText:     qsTr("Launch area and path free of obstacles/people?")
//            }
//        }

        PreFlightCheckGroup {
            name: qsTr("Before turning the drone")

//            PreFlightKillswitchCheck {
//                failureSatCount:        9
//                allowOverrideSatCount:  true
//            }

            PreFlightCheckButton {
                name:           qsTr("Frame condition")
                manualText:     qsTr("Check if there are no cracks in the frame. make sure that the bottom plate is secured.")
            }

            PreFlightCheckButton {
                name:           qsTr("Arms")
                manualText:     qsTr("Ensure that the arms are attached to the drone.")
            }

            PreFlightCheckButton {
                name:           qsTr("Legs")
                manualText:     qsTr("Ensure that the arms are attached to the drone.")
            }

            PreFlightCheckButton {
                name:           qsTr("Propellers")
                manualText:     qsTr("Ensure that the propellers are attached to the drone. Check if thay have no cracks. Unfold them and check if they spin freely.")
            }

            PreFlightCheckButton {
                name:           qsTr("Motors")
                manualText:     qsTr("Ensure that the motors are attached to the arms.")
            }

            PreFlightCheckButton {
                name:           qsTr("Camera")
                manualText:     qsTr("Ensure that the lens of the camera is clean. Ensure that the SD card is in the camera.")
            }

            PreFlightCheckButton {
                name:           qsTr("Power connection")
                manualText:     qsTr("Ensure that the power connection is attached to the drone.")
            }

            PreFlightCheckButton {
                name:           qsTr("Icing")
                manualText:     qsTr("Ensure that the propellers are not covered in ice. Make sure that it is safe to fly in current weather conditions.")
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Turn on the drone")

            PreFlightCheckButton {
                name:           qsTr("System integrity")
                manualText:     qsTr("Ensure that the controller works properly.")
            }

            PreFlightCheckButton {
                name:           qsTr("Link quality")
                manualText:     qsTr("Ensure the good connection quality between the controller and the drone.")
            }

            PreFlightCheckButton {
                name:           qsTr("ATO altitude")
                manualText:     qsTr("Ensure that there are no obstructions in the space where the drone will be flying.")
            }

            PreFlightCheckButton {
                name:           qsTr("Battery level")
                manualText:     qsTr("Ensure that the battery level is sufficient for the planned operation.")
            }

            PreFlightCheckButton {
                name:           qsTr("Camera")
                manualText:     qsTr("Ensure that the camera feed is displayed in the QGround Control.")
            }

            PreFlightCheckButton {
                name:           qsTr("Sensor feedback")
                manualText:     qsTr("Ensure that the sensors are working correctly - artificial horizon reacts to the drone orientation change, GPS Lock is \"3D RTK Lock\".") // TODO set exact text about 3d rtk fix RTK"
            }

            PreFlightCheckButton {
                name:           qsTr("FTS")
                manualText:     qsTr("Press manual FTS trigger and verify the correct termination of the FTS system.")
            }

            PreFlightCheckButton {
                name:           qsTr("Ground station sound")
                manualText:     qsTr("Ensure that the ground station sounds are turned on.")
            }

            PreFlightCheckButton {
                name:           qsTr("Drone sound")
                manualText:     qsTr("Ensure that the drone sounds are turned on. Connect to the \"SigmundDrone\" wifi network, go to sigmunddrone.com and select sound.")
            }
        }

        PreFlightCheckGroup {
            name: qsTr("Start-up procedure")

            PreFlightCheckButton {
                name:           qsTr("Ready to fly")
                manualText:     qsTr("Ensure that the status of the drone in the top right corner says \"Ready To Fly\".")
            }

            PreFlightCheckButton {
                name:           qsTr("Killswitch")
                manualText:     qsTr("Ensure the killswitch is not engaged.")
            }

            PreFlightCheckButton {
                name:           qsTr("Return to launch")
                manualText:     qsTr("Ensure that the RTL is not engaged.")
            }

            PreFlightCheckButton {
                name:           qsTr("Flight mode")
                manualText:     qsTr("Ensure that the flight mode is set to the \"Mission Mode\".")
            }
        }
    }
}
















































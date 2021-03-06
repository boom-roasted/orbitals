import QtQuick 2.15
import QtQuick3D 1.15
import QtQuick3D.Materials 1.15

Node {
    property real xRotation: Math.random() * 5
    property real yRotation: Math.random() * 5
    property real zRotation: Math.random() * 5

    property real darkeningFactor: Math.random() * 1.5 + 0.5

    property var velocity: Qt.vector3d(1, 0, 0)

    readonly property var shapes: ["#Cube", "#Cone", "#Cylinder"]
    property int shapeChoice: Math.floor(Math.random() * shapes.length);

    Model {
        source: shapes[shapeChoice]
        scale: Qt.vector3d(0.3, 0.3, 0.3)
        eulerRotation.x: 90

        SequentialAnimation on eulerRotation {
            loops: Animation.Infinite
            PropertyAnimation {
                duration: Math.random() * (10000 - 1) + 1000
                to: Qt.vector3d(xRotation -  360, yRotation - 360, zRotation - 360)
                from: Qt.vector3d(xRotation, yRotation, zRotation)
            }
        }

        materials: [ 
            DefaultMaterial
            {
                diffuseColor: Qt.darker("#FF7F50", darkeningFactor)
            }
        ]
    }

    Arrow {
        color: "blue"
        // orientation: parent.velocity
    }
}

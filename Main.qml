import QtQuick
import QtQuick.Window
import Widgets

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Cropper")

    Image{
        id: _image
        width: 400
        height: 400
        fillMode: Image.PreserveAspectCrop
        anchors.centerIn: parent
        source: "https://i.insider.com/5e0a7a0d855cc20f3632d11c?width=1000&format=jpeg&auto=webp"
    }

    Cropper{
        id: _cropper
        width: _image.width
        height: _image.height
        anchors.centerIn: parent
        opacity: 0
        MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onPressed: {
                        _cropper.opacity = 1

                        _cropper.x1 = mouseX
                        _cropper.y1 = mouseY
                    }

                    onMouseXChanged: {
                        _cropper.x2 = mouseX
                    }
                    onMouseYChanged: {
                        _cropper.y2 = mouseY
                    }
                }

    }
}

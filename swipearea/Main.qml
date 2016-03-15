import QtQuick 2.4
import Ubuntu.Components 1.3

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "swipearea.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    property int index: 1

    Page {
        title: "SwipeArea sample"

        CrossFadeImage {
            id: img
            anchors.fill: parent
            source: "images/image1.jpg"
            fadeDuration: 10000
            fadeStyle: "overlay"
        }

        SwipeArea {
            id: swipeleft
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: parent.top
            }

            // SwipeArea.Rightwards
            direction:  SwipeArea.Leftwards

            onDraggingChanged: {
                console.log("dragging: " + dragging)

                if ( dragging ) {
                    index ++;

                    if ( index >= 5) {
                        index = 5
                    }

                    var image = "images/image" + index + ".jpg"
                    console.log("image source: " + image)
                    img.source = image
                }
            }
        }

        SwipeArea {
            id: swiperight
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: parent.top
            }

            // SwipeArea.Rightwards
            direction: SwipeArea.Rightwards

            onDraggingChanged: {
                console.log("dragging1: " + dragging)

                if ( dragging ) {
                    index--

                    if ( index <= 1 ) {
                        index = 1
                    }

                    var image = "images/image" + index + ".jpg"
                    console.log("image source1: " + image)
                    img.source = image
                }
            }
        }
    }
}



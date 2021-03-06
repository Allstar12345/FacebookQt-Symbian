/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Components project.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 1.1
import Qt.labs.components 1.1
import "." 1.1

Item {
    id: root

    // Common Public API
    property alias minimumValue: model.minimumValue
    property alias maximumValue: model.maximumValue
    property alias value: model.value
    property bool indeterminate: false

    // Symbian specific API
    property bool platformInverted: false

    implicitWidth: Math.max(50, screen.width / 2) // TODO: use screen.displayWidth
    implicitHeight: privateStyle.sliderThickness

    BorderImage {
        id: background
        source: privateStyle.imagePath("qtg_fr_progressbar_track", root.platformInverted)
        border { left: platformStyle.borderSizeMedium; top: 0; right: platformStyle.borderSizeMedium; bottom: 0 }
        anchors.fill: parent
    }

    Loader {
        id: progressBarContent

        LayoutMirroring.enabled: false
        LayoutMirroring.childrenInherit: true

        states: [

            State {
                name: "determinate"
                when: !root.indeterminate
                PropertyChanges { target: progressBarContent; sourceComponent: determinateContent }
                AnchorChanges {
                    target: progressBarContent
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                }
            }
        ]
    }




    Component {
        id: determinateContent

        Item {
            id: progressMask
            width: model.position
            clip: true

            Rectangle {
                smooth: true
                id: progress
                radius: 20
                color: platformInverted? "#0077ff": "#0011ff"

                height: parent.height
                width: root.width
            }
        }
    }

    RangeModel {
        id: model
        minimumValue: 0.0
        maximumValue: 1.0
        positionAtMinimum: 0.0
        positionAtMaximum: background.width
    }
}


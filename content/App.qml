// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls 6.2
import IMRF

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "IMRF"

    MainContent {
        id: mainScreen
    }

    Sidebar {
        id: sidebar
        x: sidebar.sidebarVisible ? 0 : -sidebar.width
        z: 1 // Initial position
    }

    Header {
        id: heaeder
    }

    Button {
        text: sidebar.sidebarVisible ? "Hide Sidebar" : "Show Sidebar"
        onClicked: sidebar.sidebarVisible = !sidebar.sidebarVisible // Toggle sidebar visibility
        anchors.top: parent.top
        anchors.leftMargin: 17
        anchors.topMargin: 14
        z: 2
        anchors.left: parent.left
    }


}


#!/usr/bin/env python2
# encoding: utf-8

from PyQt5.QtCore import QObject, QUrl
from PyQt5.Qt import QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication

if __name__=='__main__':
    import os
    import sys

class Main(QObject):
    def __init__(self,parent=None):
        super(Main, self).__init__(parent)
        self.engine = QQmlApplicationEngine(self)
        self.engine.addImportPath("./Modules")
        self.engine.load(QUrl.fromLocalFile('main.qml'))
        self.window = self.engine.rootObjects()[0]

    def show(self):
        self.window.show()


app=QApplication(sys.argv)
main=Main()
main.show()
sys.exit(app.exec_())

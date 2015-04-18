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
        # 注意，在demo中，部分demo使用到了单例qml，需要使用qmldir来生效，所有需要导入demo
        self.engine.addImportPath("./demo")
        self.engine.load(QUrl.fromLocalFile('main.qml'))
        self.window = self.engine.rootObjects()[0]

    def show(self):
        self.window.show()


app=QApplication(sys.argv)
main=Main()
main.show()
sys.exit(app.exec_())

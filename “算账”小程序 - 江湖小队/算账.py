# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file '算账.ui'
#
# Created by: PyQt5 UI code generator 5.15.6
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox
from PyQt5.QtWidgets import QInputDialog


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 470)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.tableWidget = QtWidgets.QTableWidget(self.centralwidget)
        self.tableWidget.setGeometry(QtCore.QRect(50, 40, 701, 191))
        self.tableWidget.setObjectName("tableWidget")
        self.tableWidget.setColumnCount(5)
        self.tableWidget.setRowCount(0)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(3, item)
        item = QtWidgets.QTableWidgetItem()
        self.tableWidget.setHorizontalHeaderItem(4, item)
        self.tableWidget.setShowGrid(True)
        self.tableWidget.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)
        self.tableWidget.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)
        self.tableWidget.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        self.pushButton = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton.setGeometry(QtCore.QRect(80, 300, 100, 30))
        self.pushButton.setObjectName("pushButton")
        self.pushButton_2 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_2.setGeometry(QtCore.QRect(260, 300, 100, 30))
        self.pushButton_2.setObjectName("pushButton_2")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(50, 360, 50, 16))
        self.label.setObjectName("label")
        self.label_2 = QtWidgets.QLabel(self.centralwidget)
        self.label_2.setGeometry(QtCore.QRect(50, 410, 50, 16))
        self.label_2.setObjectName("label_2")
        self.textEdit = QtWidgets.QTextEdit(self.centralwidget)
        self.textEdit.setGeometry(QtCore.QRect(100, 355, 600, 28))
        self.textEdit.setObjectName("textEdit")
        self.textEdit_2 = QtWidgets.QTextEdit(self.centralwidget)
        self.textEdit_2.setGeometry(QtCore.QRect(100, 405, 600, 28))
        self.textEdit_2.setObjectName("textEdit_2")
        self.label_3 = QtWidgets.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(390, 20, 71, 16))
        self.label_3.setObjectName("label_3")
        self.pushButton_3 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_3.setGeometry(QtCore.QRect(440, 300, 100, 30))
        self.pushButton_3.setObjectName("pushButton_3")
        self.pushButton_4 = QtWidgets.QPushButton(self.centralwidget)
        self.pushButton_4.setGeometry(QtCore.QRect(620, 300, 100, 30))
        self.pushButton_4.setObjectName("pushButton_4")
        self.textEdit_3 = QtWidgets.QTextEdit(self.centralwidget)
        self.textEdit_3.setGeometry(QtCore.QRect(100, 255, 180, 28))
        self.textEdit_3.setObjectName("textEdit_3")
        self.label_4 = QtWidgets.QLabel(self.centralwidget)
        self.label_4.setGeometry(QtCore.QRect(50, 260, 51, 16))
        self.label_4.setObjectName("label_4")
        self.textEdit_4 = QtWidgets.QTextEdit(self.centralwidget)
        self.textEdit_4.setGeometry(QtCore.QRect(404, 255, 78, 28))
        self.textEdit_4.setObjectName("textEdit_4")
        self.label_5 = QtWidgets.QLabel(self.centralwidget)
        self.label_5.setGeometry(QtCore.QRect(340, 260, 51, 16))
        self.label_5.setObjectName("label_5")
        self.label_6 = QtWidgets.QLabel(self.centralwidget)
        self.label_6.setGeometry(QtCore.QRect(560, 260, 71, 16))
        self.label_6.setObjectName("label_6")
        self.textEdit_5 = QtWidgets.QTextEdit(self.centralwidget)
        self.textEdit_5.setGeometry(QtCore.QRect(638, 255, 83, 28))
        self.textEdit_5.setObjectName("textEdit_5")
        self.label_7 = QtWidgets.QLabel(self.centralwidget)
        self.label_7.setGeometry(QtCore.QRect(730, 260, 21, 16))
        self.label_7.setObjectName("label_7")
        self.label_8 = QtWidgets.QLabel(self.centralwidget)
        self.label_8.setGeometry(QtCore.QRect(490, 260, 21, 16))
        self.label_8.setObjectName("label_8")
        self.pushButton.clicked.connect(self.do1)
        self.pushButton_2.clicked.connect(self.do2)
        self.pushButton_3.clicked.connect(self.do3)
        self.pushButton_4.clicked.connect(self.do4)
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 26))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def do1(self):
        try:
            a1 = self.textEdit_3.toPlainText()
            a2 = self.textEdit_4.toPlainText()
            a3 = self.textEdit_5.toPlainText()
            A2 = float(a2)
            A2 = round(A2, 2)
            A3 = float(a3)
            A3 = A3 / 100
            A4 = A2 * A3
            A3 = A3 * 100
            A3 = round(A3,2)
            A4 = round(A4,2)
            A5 = A2-A4
            A5 = round(A5,2)
            a2 = str(A2)
            a3 = str(A3)
            a4 = str(A4)
            a5 = str(A5)
            select=QMessageBox.information(MainWindow, "添加", a1 + '共' + a2 + '元，甲方得' + a3 + '%。',QMessageBox.Yes | QMessageBox.No)
            if select==QMessageBox.Yes:
                self.tableWidget.insertRow(int(self.tableWidget.rowCount()))
                R = self.tableWidget.rowCount()
                item1=QtWidgets.QTableWidgetItem(f"{a1}")
                self.tableWidget.setItem(R-1,0,item1)
                item2=QtWidgets.QTableWidgetItem(f"{a2}")
                self.tableWidget.setItem(R-1,1,item2)
                item3=QtWidgets.QTableWidgetItem(f"{a3}")
                self.tableWidget.setItem(R-1,2,item3)
                item4=QtWidgets.QTableWidgetItem(f"{a4}")
                self.tableWidget.setItem(R-1,3,item4)
                item5=QtWidgets.QTableWidgetItem(f"{a5}")
                self.tableWidget.setItem(R-1,4,item5)
                QMessageBox.information(MainWindow,"添加","已添加！",QMessageBox.Ok)
        except:
            QMessageBox.information(MainWindow, "添加", "请输入完整！", QMessageBox.Ok)


    def do2(self):
        R=self.tableWidget.rowCount()
        if R==0:
            QMessageBox.information(MainWindow, "删除", "没有可删除行！", QMessageBox.Ok)
        else:
            try:
                index = self.tableWidget.selectedRanges()
                index = index[0].bottomRow()
                v=self.tableWidget.item(index,0).text()
                select=QMessageBox.information(MainWindow,"删除","确认删除"+v+"？",QMessageBox.Yes | QMessageBox.No)
                if select==QMessageBox.Yes:
                    self.tableWidget.removeRow(index)
                    mark=1
                elif select==QMessageBox.No:
                    mark=0
            except:
                QMessageBox.information(MainWindow, "删除", "由于未选中删除失败！", QMessageBox.Ok)
                mark=0
            if mark==1:
                QMessageBox.information(MainWindow, "删除", "删除成功！", QMessageBox.Ok)

    def do3(self):
        try:
            M1 = 0
            M2 = 0
            M3 = 0
            a1 = self.textEdit.toPlainText()
            a2 = self.textEdit_2.toPlainText()
            R = self.tableWidget.rowCount()
            det="交易清单"
            for i in range(R):
                v1 = self.tableWidget.item(i, 1).text()
                v2 = self.tableWidget.item(i, 3).text()
                v3 = self.tableWidget.item(i, 4).text()
                V1 = float(v1)
                V2 = float(v2)
                V3 = float(v3)
                M1 += V1
                M2 += V2
                M3 += V3
                det+="\n"+"("+str(i+1)+")"+self.tableWidget.item(i,0).text()
                det+=":共"+str(self.tableWidget.item(i,1).text())+"元，甲方所得占"
                det+=str(self.tableWidget.item(i,2).text())+"%，甲方得"
                det+=str(self.tableWidget.item(i,3).text())+"元，乙方得"
                det+=str(self.tableWidget.item(i,4).text())+"元。"
            DB="\n甲方："+a1+"\n乙方："+a2
            m1 = str(M1)
            m2 = str(M2)
            m3 = str(M3)
            total="总所得："+m1+"元\n甲方所得："+m2+"元\n乙方所得："+m3+"元"
            QMessageBox.information(MainWindow,"查看",det+"\n"+total+DB,QMessageBox.Ok)
        except:
            QMessageBox.information(MainWindow,"查看","无法查看！", QMessageBox.Ok)

    def do4(self):
        M1 = 0
        M2 = 0
        M3 = 0
        a1 = self.textEdit.toPlainText()
        a2 = self.textEdit_2.toPlainText()
        R = self.tableWidget.rowCount()
        det = "交易清单"
        for i in range(R):
            v1 = self.tableWidget.item(i, 1).text()
            v2 = self.tableWidget.item(i, 3).text()
            v3 = self.tableWidget.item(i, 4).text()
            V1 = float(v1)
            V2 = float(v2)
            V3 = float(v3)
            M1 += V1
            M2 += V2
            M3 += V3
            det += "\n" + "(" + str(i + 1) + ")" + self.tableWidget.item(i, 0).text()
            det += ":共" + str(self.tableWidget.item(i, 1).text()) + "元，甲方所得占"
            det += str(self.tableWidget.item(i, 2).text()) + "%，甲方得"
            det += str(self.tableWidget.item(i, 3).text()) + "元，乙方得"
            det += str(self.tableWidget.item(i, 4).text()) + "元。"
        DB = "\n甲方：" + a1 + "\n乙方：" + a2
        m1 = str(M1)
        m2 = str(M2)
        m3 = str(M3)
        total = "总所得：" + m1 + "元\n甲方所得：" + m2 + "元\n乙方所得：" + m3 + "元"
        message=det + "\n" + total + DB
        select=QMessageBox.information(MainWindow, "导出","是否导出？", QMessageBox.Yes | QMessageBox.No)
        if select==QMessageBox.Yes:
            output,ok=QInputDialog.getText(MainWindow, "导出", "文件名：")
            if ok:
                file = open(output+'.txt', mode='w+')
                file.write(message)
                file.close()
                QMessageBox.information(MainWindow,"导出","导出成功！", QMessageBox.Ok)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "算账"))
        item = self.tableWidget.horizontalHeaderItem(0)
        item.setText(_translate("MainWindow", "名称"))
        item = self.tableWidget.horizontalHeaderItem(1)
        item.setText(_translate("MainWindow", "总所得（元）"))
        item = self.tableWidget.horizontalHeaderItem(2)
        item.setText(_translate("MainWindow", "甲方比例（%）"))
        item = self.tableWidget.horizontalHeaderItem(3)
        item.setText(_translate("MainWindow", "甲方所得（元）"))
        item = self.tableWidget.horizontalHeaderItem(4)
        item.setText(_translate("MainWindow", "乙方所得（元）"))
        self.pushButton.setText(_translate("MainWindow", "添加"))
        self.pushButton_2.setText(_translate("MainWindow", "删除"))
        self.label.setText(_translate("MainWindow", "甲方："))
        self.label_2.setText(_translate("MainWindow", "乙方："))
        self.label_3.setText(_translate("MainWindow", "交易列表"))
        self.pushButton_3.setText(_translate("MainWindow", "查看"))
        self.pushButton_4.setText(_translate("MainWindow", "导出"))
        self.label_4.setText(_translate("MainWindow", "名称："))
        self.label_5.setText(_translate("MainWindow", "总所得："))
        self.label_6.setText(_translate("MainWindow", "甲方比例："))
        self.label_7.setText(_translate("MainWindow", "%"))
        self.label_8.setText(_translate("MainWindow", "元"))


import sys
if __name__=='__main__':
    app=QtWidgets.QApplication(sys.argv)
    MainWindow=QtWidgets.QMainWindow()
    ui=Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
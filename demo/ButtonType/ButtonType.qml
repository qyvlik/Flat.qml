/*
 * author qyvlik
 * email qyvlik@qq.com
 * time 2015/4/10
*/

import QtQuick 2.0
import FlatUI 2.0
import QtQuick.Layouts 1.1

FlatMainWindow{
    title:"Button Type"
    content: Flow{
        spacing: 10
        FlatButton{
            text:"danger"
            type:FlatGlobal.typeDanger
        }
        FlatButton{
            text:"default"
            type:FlatGlobal.typeDefault
        }
        FlatButton{
            text:"disabled"
            type:FlatGlobal.typeDisabled
        }
        FlatButton{
            text:"infomation"
            type:FlatGlobal.typeInfo
        }
        FlatButton{
            text:"inverse"
            type:FlatGlobal.typeInverse
        }
        FlatButton{
            text:"primary"
            type:FlatGlobal.typePrimary
        }
        FlatButton{
            text:"success"
            type:FlatGlobal.typeSuccess
        }
        FlatButton{
            text:"warning"
            type:FlatGlobal.typeWarning
        }
    }
}

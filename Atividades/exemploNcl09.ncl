<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="25%" top="25%" width="50%" height="50%" />
                <region id="rgVideo2" left="25%" top="25%" width="50%" height="50%" />

                <region id="rgBtnVerde" left="10%" top="25%" width="0" height="0" />
                <region id="rgBtnVermelho" left="20%" top="25%" width="0" height="0" />
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dVideo2" region="rgVideo2">
                <descriptorParam name="visible" value="false" />
                <descriptorParam name="soundLevel" value="0" />
            </descriptor>

            <descriptor id="dBtnVerde" region="rgBtnVerde" />
            <descriptor id="dBtnVermelho" region="rgBtnVermelho" />
        </descriptorBase>

        <connectorBase id="conectores">

            <causalConnector id="onKeySelectionSet" >
                <connectorParam name="keyCode" />
                <connectorParam name="var" />
                <simpleCondition role="onSelection" key="$keyCode" />
                <simpleAction role="set" value="$var" />
            </causalConnector>
            
            <causalConnector id="onBeginSetStart" >
                <connectorParam name="var" />
                <simpleCondition role="onBegin" />
                <simpleAction role="start" />
                <simpleAction role="set" value="$var" />
            </causalConnector>

            <causalConnector id="onEndStart">
                <simpleCondition role="onEnd" />
                <simpleAction role="start" />
            </causalConnector>

            <causalConnector id="onBeginStart">
                <simpleCondition role="onBegin" />
                <simpleAction role="start" />
            </causalConnector>

            <causalConnector id="onEndStop">
                <simpleCondition role="onEnd" />
                <simpleAction role="stop" />
            </causalConnector>

        </connectorBase>
    </head>
    <body>
        <port id="pInicio1" component="video1" />
        <port id="pInicio2" component="video2" />
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1">
            <property name="visible" />
            <property name="soundLevel" />
        </media>
        <media id="video2" type="video/mpg" src="media/video3.mpg" descriptor="dVideo2">
            <property name="visible" />
            <property name="soundLevel" />
        </media>

        <port id="pBtnVerde" component="btnVerde" />
        <port id="pBtnVermelho" component="btnVermelho" />
        <media id="btnVerde" src="media/chill_jake.jpg" descriptor="dBtnVerde" />
        <media id="btnVermelho" src="media/chill_jake.jpg" descriptor="dBtnVermelho" />

        <link id="lShowVideo2" xconnector="onKeySelectionSet">
            <bind component="btnVerde" role="onSelection">
                <bindParam name="keyCode" value="1" />
            </bind>
            <bind role="set" component="video2" interface="visible">
                <bindParam name="var" value="true" />
            </bind>
            <bind role="set" component="video2" interface="soundLevel">
                <bindParam name="var" value="1" />
            </bind>
        </link>

        <link id="lHideVideo2" xconnector="onKeySelectionSet">
            <bind component="btnVerde" role="onSelection">
                <bindParam name="keyCode" value="2" />
            </bind>
            <bind role="set" component="video2" interface="visible">
                <bindParam name="var" value="false" />
            </bind>
            <bind role="set" component="video2" interface="soundLevel">
                <bindParam name="var" value="0" />
            </bind>
        </link>

        <link id="lShowVideo1" xconnector="onKeySelectionSet">
            <bind component="btnVerde" role="onSelection">
                <bindParam name="keyCode" value="2" />
            </bind>
            <bind role="set" component="video1" interface="visible">
                <bindParam name="var" value="true" />
            </bind>
            <bind role="set" component="video1" interface="soundLevel">
                <bindParam name="var" value="1" />
            </bind>
        </link>

        <link id="lHideVideo1" xconnector="onKeySelectionSet">
            <bind component="btnVerde" role="onSelection">
                <bindParam name="keyCode" value="1" />
            </bind>
            <bind role="set" component="video1" interface="visible">
                <bindParam name="var" value="false" />
            </bind>
            <bind role="set" component="video1" interface="soundLevel">
                <bindParam name="var" value="0" />
            </bind>
        </link>
        
    </body>
</ncl>
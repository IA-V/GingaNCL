<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="25%" bottom="25%" width="25%" height="25%" />
                <region id="rgVideo2" left="25%" top="25%" width="25%" height="25%" />
                <region id="rgVideo3" left="50%" top="25%" width="25%" height="25%" />

                <region id="rgBtnVerde" width="12%" height="12%" top="5%" left="5%"  />
                <region id="rgBtnVermelho" width="12%" height="12%" top="5%" left="15%" />
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dVideo2" region="rgVideo2">
                <descriptorParam name="scroll" value="none" />
            </descriptor>
            <descriptor id="dVideo3" region="rgVideo3" />

            <descriptor id="dBtnVerde" region="rgBtnVerde" />
            <descriptor id="dBtnVermelho" region="rgBtnVermelho" />
        </descriptorBase>

        <connectorBase id="conectores">

            <causalConnector id="onKeySelectionStartStopAbort" >
                <connectorParam name="keyCode" />
                <simpleCondition role="onSelection" key="$keyCode" />
                <simpleAction role="start" />
                <simpleAction role="abort" />
                <simpleAction role="stop" />
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
        <port id="pInicio" component="video1" />
        <port id="pImg1" component="btnVerde1" />
        <port id="pImg2" component="btnVermelho1" />
        <media id="btnVerde1" src="media/chill_jake.jpg" descriptor="dBtnVerde" />
        <media id="btnVermelho1" src="media/chill_jake.jpg" descriptor="dBtnVermelho" />
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1" />
        <media id="video2" type="video/mpg" src="media/video3.mpg" descriptor="dVideo2" />
        <media id="video3" type="video/mpg" src="media/video2.mpg" descriptor="dVideo3" />
        
        <link id="lBtnVerdePressionado" xconnector="onKeySelectionStartStopAbort">
            <bind component="btnVerde1" role="onSelection">
                <bindParam name="keyCode" value="1" />
            </bind>
            <bind role="abort" component="video1" />
            <bind role="start" component="video2" />
            <bind role="stop" component="btnVerde1" />
            <bind role="stop" component="btnVermelho1" />
        </link>

        <link id="lBtnVermelhoPressionado" xconnector="onKeySelectionStartStopAbort">
            <bind component="btnVermelho1" role="onSelection">
                <bindParam name="keyCode" value="2" />
            </bind>
            <bind role="abort" component="video1" />
            <bind role="start" component="video3" />
            <bind role="stop" component="btnVerde1" />
            <bind role="stop" component="btnVermelho1" />
        </link>

        <link id="lLoop" xconnector="onEndStart">
            <bind component="video1" role="onEnd" />
            <bind role="start" component="video1" />
        </link>
        
    </body>
</ncl>
<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="25%" bottom="25%" width="25%" height="25%" />
                <region id="rgVideo2" left="25%" top="25%" width="25%" height="25%" />

                <region id="rgBtnVerde" width="12%" height="12%" top="5%" left="5%"  />
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dVideo2" region="rgVideo2">
                <descriptorParam name="scroll" value="none" />
            </descriptor>

            <descriptor id="dBtnVerde" region="rgBtnVerde" />
        </descriptorBase>

        <connectorBase id="conectores">

            <causalConnector id="onKeySelectionStartStopAbort" >
                <connectorParam name="keyCode" />
                <simpleCondition role="onSelection" key="1" />
                <simpleAction role="start" />
                <simpleAction role="abort" />
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
        <media id="btnVerde1" src="media/chill_jake.jpg" descriptor="dBtnVerde" />
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1" />
        <media id="video2" type="video/mpg" src="media/video3.mpg" descriptor="dVideo2" />
        
        <link id="lBtnPressionado" xconnector="onKeySelectionStartStopAbort">
            <bind component="btnVerde1" role="onSelection" />
            <bind role="abort" component="video1" />
            <bind role="start" component="video2" />
        </link>

        <link id="lLoop" xconnector="onEndStart">
            <bind component="video1" role="onEnd" />
            <bind role="start" component="video1" />
        </link>
        
    </body>
</ncl>
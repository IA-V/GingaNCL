<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="25%" bottom="25%" width="25%" height="25%" />
                <region id="rgVideo2" left="25%" top="25%" width="25%" height="25%" />
                <region id="rgVideo3" left="50%" top="25%" width="25%" height="25%" />
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dVideo2" region="rgVideo2">
                <descriptorParam name="scroll" value="none" />
            </descriptor>
            <descriptor id="dVideo3" region="rgVideo3" />
        </descriptorBase>

        <connectorBase id="conectores">

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
        <port id="pInicio" component="video3" />
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1" />
        <media id="video2" type="video/mpg" src="media/video3.mpg" descriptor="dVideo2" />
        <media id="video3" type="video/mpg" src="media/video2.mpg" descriptor="dVideo3">
            <area id="aVideo3" begin="2s" end="3s" />
            <property name="bounds" />
        </media>

        <link id="lSetBounds" xconnector="onBeginSetStart">
            <bind component="video3" interface="aVideo3" role="onBegin" />
            <bind component="video3" interface="bounds" role="set">
                <bindParam name="var" value="10%,10%,50,45" />
            </bind>
            <bind role="start" component="video2" />
        </link>

        <link id="lStopVideo3" xconnector="onEndStop">
            <bind component="video3" interface="aVideo3" role="onEnd" />
            <bind component="video3" role="stop" />
        </link>
        
    </body>
</ncl>
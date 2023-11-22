<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="25%" bottom="25%" width="25%" height="25%" />
                <region id="rgVideo2" left="25%" top="25%" width="25%" height="25%" />
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dVideo2" region="rgVideo2">
                <descriptorParam name="scroll" value="none" />
            </descriptor>
        </descriptorBase>

        <connectorBase id="conectores">

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
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1" />
        <media id="video2" type="video/mpg" src="media/video3.mpg" descriptor="dVideo2" >
            <area id="aTrecho1" begin="3s" end="5s" />
            <area id="aTrecho2" begin="8s" end="10s" />
        </media>
        
        <link id="lVideoTermina" xconnector="onEndStart">
            <bind role="onEnd" component="video1" />
            <bind role="start" component="video2" interface="aTrecho1" />
        </link>
        <link id="lTrechoTermina1" xconnector="onEndStop">
            <bind role="onEnd" component="video2" interface="aTrecho1" />
            <bind role="stop" component="video2" />
        </link>
        
        <link id="lTrechoTermina2" xconnector="onEndStart">
            <bind role="onEnd" component="video2" />
            <bind role="start" component="video2" interface="aTrecho2" />
        </link>
        <link id="lTrechoTermina3" xconnector="onEndStop">
            <bind role="onEnd" component="video2" interface="aTrecho2" />
            <bind role="stop" component="video2" interface="aTrecho2" />
        </link>
        
    </body>
</ncl>
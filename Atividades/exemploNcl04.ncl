<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="10%" bottom="10%" width="75%" height="75%">
                    <region id="rgLegenda" top="5%" left="25%" />
                </region>
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dLegenda1" region="rgLegenda" />
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
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1">
            <area id="aLegenda1" begin="2.5s" end="3.5s"/>
            <area id="aLegenda2" begin="3.5s" end="4s"/>
            <area id="aLegenda3" begin="5s" end="6.25s"/>
        </media>

        <media id="legenda1" type="text/plain" src="media/legenda1.txt" descriptor="dLegenda1" />
        <media id="legenda2" type="text/plain" src="media/legenda2.txt" descriptor="dLegenda1" />
        <media id="legenda3" type="text/plain" src="media/legenda3.txt" descriptor="dLegenda1" />
        
        <link id="lLegenda1" xconnector="onBeginStart">
            <bind role="onBegin" component="video1" interface="aLegenda1" />
            <bind role="start" component="legenda1"  />
        </link>
        <link id="lLegenda2" xconnector="onEndStop">
            <bind role="onEnd" component="video1" interface="aLegenda1" />
            <bind role="stop" component="legenda1" />
        </link>

        <link id="lLegenda3" xconnector="onBeginStart">
            <bind role="onBegin" component="video1" interface="aLegenda2"/>
            <bind role="start" component="legenda3" />
        </link>
        <link id="lLegenda4" xconnector="onEndStop">
            <bind role="onEnd" component="video1" interface="aLegenda2" />
            <bind role="stop" component="legenda3" />
        </link>

        <link id="lLegenda5" xconnector="onBeginStart">
            <bind role="onBegin" component="video1" interface="aLegenda3"/>
            <bind role="start" component="legenda2" />
        </link>
        <link id="lLegenda6" xconnector="onEndStop">
            <bind role="onEnd" component="video1" interface="aLegenda3" />
            <bind role="stop" component="legenda2" />
        </link>
    </body>
</ncl>
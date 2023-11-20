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
                <connectorParam name="delay" />
                <simpleCondition role="onBegin" />
                <simpleAction role="start" />
            </causalConnector>

        </connectorBase>
    </head>
    <body>
        <port id="pInicio" component="video1" />
        <media id="video1" type="video/mpg" src="media/video1.mp4" descriptor="dVideo1" />
        <media id="video2" type="video/mpg" src="media/video2.mpg" descriptor="dVideo2" />
        
        <link id="lVideoTermina" xconnector="onEndStart">
            <bind role="onEnd" component="video1" />
            <bind role="start" component="video2" />
        </link>
    </body>
</ncl>
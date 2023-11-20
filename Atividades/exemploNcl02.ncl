<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase id="regioes">
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="50%" bottom="25%" width="25%" height="25%" />
                <region id="rgTexto1" left="50%" top="25%" width="25%" height="10%" />
            </region>
        </regionBase>

        <descriptorBase id="descritores">
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dTexto1" region="rgTexto1" />
                
        </descriptorBase>

        <connectorBase id="conectores">

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
        <media id="video1" src="media/video1.mp4" descriptor="dVideo1" />
        <media id="texto1" src="media/texto1.txt" descriptor="dTexto1" />
        
        <link id="lVideoInicia" xconnector="onBeginStart">
            <bind role="onBegin" component="video1" />
            <bind role="start" component="texto1" />
        </link>
        
        <link id="lVideoTermina" xconnector="onEndStop">
            <bind role="onEnd" component="video1" />
            <bind role="stop" component="texto1" />
        </link>
    </body>
</ncl>
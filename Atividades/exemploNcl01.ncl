<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exemplo01" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
    <head>
        <regionBase>
            <region id="rgTV" width="100%" height="100%">
                <region id="rgVideo1" left="5%" bottom="5%" width="25%" height="25%" />
                <region id="rgImg1" left="5%" top="5%" width="25%" height="25%" />
            </region>
        </regionBase>
        <descriptorBase>
            <descriptor id="dVideo1" region="rgVideo1" />
            <descriptor id="dImg1" region="rgImg1" />
        </descriptorBase>
    </head>
    <body>
        <port id="pInicio" component="video1" />
        <media id="video1" src="media/video1.mpg" descriptor="dVideo1" />
        <port id="pImg" component="img1" />
        <media id="img1" src="media/chill_jake.jpg" descriptor="dImg1" />
    </body>
</ncl>
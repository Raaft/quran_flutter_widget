# Quran Widget Flutter
## Description
#### Package to get Narrations, Books, Chapters,Recitations for Favorite Reciters and View Quran Pages with bast View

## Getting Started

## setup your app
#### Add lib in Your Project 
    dependencies:
        quran_widget_flutter:<Last Version>
#### First visit our Web Site  and get client Id and client Secret than Call 
    DataSource.initialApp(clientId: {Your client Id}, clientSecret: {Your client Secret}) 
#### You Can Access Method DataSource
    DataSource.instance.{method Name}
#### Method in DataSource
##### Fetch Narrations
    DataSource.instance.fetchNarrationsList(qurey: {Your Search key Word})
###### this Method get all Narrations or Send value to seatch on Narrations by it 
    DataSource.instance.fetchNarrationById({Your Narration Id})
###### this Method get One Narration Have id you send to it



object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 293
  Width = 464
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Server = DSServer1
    Filters = <>
    Left = 96
    Top = 73
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object DSHTTPService: TDSHTTPService
    HttpPort = 8080
    Active = True
    DSPort = 8301
    Filters = <
      item
        FilterId = 'PC1'
        Properties.Strings = (
          'Key=test')
      end
      item
        FilterId = 'RSA'
        Properties.Strings = (
          'UseGlobalKey=true'
          'KeyLength=1024'
          'KeyExponent=3')
      end
      item
        FilterId = 'ZLibCompression'
        Properties.Strings = (
          'CompressMoreThan=1024')
      end>
    Left = 96
    Top = 135
  end
end

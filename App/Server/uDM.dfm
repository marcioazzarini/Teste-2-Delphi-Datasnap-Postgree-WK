object DM: TDM
  OldCreateOrder = False
  Height = 299
  Width = 401
  object FDConn: TFDConnection
    ConnectionName = 'PGSQL'
    Params.Strings = (
      'Database=wktech'
      'User_Name=postgres'
      'Password=ogampl28!'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    DriverID = 'PG'
    VendorLib = 'libpq.dll'
    Left = 152
    Top = 40
  end
end

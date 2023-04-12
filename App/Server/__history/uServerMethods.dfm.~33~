object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 372
  Width = 684
  object qryPessoa: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * '
      'FROM pessoa')
    Left = 24
    Top = 16
    object qryPessoaidpessoa: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'idpessoa'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPessoafinatureza: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'finatureza'
    end
    object qryPessoadsdocumento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dsdocumento'
    end
    object qryPessoanmprimeiro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmprimeiro'
      ProviderFlags = []
      Size = 108
    end
    object qryPessoanmsegundo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmsegundo'
      ProviderFlags = []
      Size = 100
    end
    object qryPessoadtregistro: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dtregistro'
      ProviderFlags = []
    end
  end
  object dspPessoa: TDataSetProvider
    DataSet = qryPessoa
    Left = 24
    Top = 80
  end
  object qryEndereco: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT E.idendereco,'
      'idpessoa,'
      'dscep,'
      'dsuf,'
      'nmcidade,'
      'nmbairro,'
      'nmlogradouro,'
      'dscomplemento'
      'FROM endereco E'
      'INNER JOIN endereco_integracao I on E.idendereco = I.idendereco'
      'WHERE E.idpessoa = :idpessoa')
    Left = 88
    Top = 16
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryEnderecoidendereco: TLargeintField
      FieldName = 'idendereco'
    end
    object qryEnderecoidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object qryEnderecodscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
    object qryEnderecodsuf: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dsuf'
      Origin = 'dsuf'
      Size = 50
    end
    object qryEndereconmcidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmcidade'
      Origin = 'nmcidade'
      Size = 100
    end
    object qryEndereconmbairro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmbairro'
      Origin = 'nmbairro'
      Size = 50
    end
    object qryEndereconmlogradouro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nmlogradouro'
      Origin = 'nmlogradouro'
      Size = 100
    end
    object qryEnderecodscomplemento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'dscomplemento'
      Origin = 'dscomplemento'
      Size = 100
    end
  end
  object dspEndereco: TDataSetProvider
    DataSet = qryEndereco
    Left = 88
    Top = 80
  end
  object qryPessoaInsert: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
        'INSERT INTO pessoa(idpessoa, finatureza, dsdocumento, nmprimeiro' +
        ', nmsegundo, dtregistro)'
      
        'VALUES (:idpessoa, :finatureza, :dsdocumento, :nmprimeiro, :nmse' +
        'gundo, :dtregistro)')
    Left = 176
    Top = 16
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'FINATUREZA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DSDOCUMENTO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NMPRIMEIRO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NMSEGUNDO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'DTREGISTRO'
        DataType = ftDateTime
        ParamType = ptInput
      end>
  end
  object qryEnderecoIntegDelete: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'DELETE FROM  endereco_integracao'
      'WHERE idendereco = :idendereco')
    Left = 400
    Top = 128
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryEnderecoIntegUpdate: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'UPDATE endereco_integracao'
      '    SET idendereco=:idendereco, '
      #9'dsuf=:dsuf, '
      #9'nmcidade=:nmcidade, '
      #9'nmbairro=:nmbairro, '
      #9'nmlogradouro=:nmlogradouro, '
      '                dscomplemento=:dscomplemento'
      'WHERE idendereco = :idendereco')
    Left = 400
    Top = 72
    ParamData = <
      item
        Name = 'IDENDERECO'
        ParamType = ptInput
      end
      item
        Name = 'DSUF'
        ParamType = ptInput
      end
      item
        Name = 'NMCIDADE'
        ParamType = ptInput
      end
      item
        Name = 'NMBAIRRO'
        ParamType = ptInput
      end
      item
        Name = 'NMLOGRADOURO'
        ParamType = ptInput
      end
      item
        Name = 'DSCOMPLEMENTO'
        ParamType = ptInput
      end>
  end
  object qryEnderecoIntegInsert: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      
        'INSERT INTO endereco_integracao(idendereco, dsuf, nmcidade, nmba' +
        'irro, nmlogradouro, dscomplemento)'
      
        'VALUES (:idendereco, :dsuf, :nmcidade, :nmbairro, :nmlogradouro,' +
        ' :dscomplemento)')
    Left = 400
    Top = 16
    ParamData = <
      item
        Name = 'IDENDERECO'
        ParamType = ptInput
      end
      item
        Name = 'DSUF'
        ParamType = ptInput
      end
      item
        Name = 'NMCIDADE'
        ParamType = ptInput
      end
      item
        Name = 'NMBAIRRO'
        ParamType = ptInput
      end
      item
        Name = 'NMLOGRADOURO'
        ParamType = ptInput
      end
      item
        Name = 'DSCOMPLEMENTO'
        ParamType = ptInput
      end>
  end
  object qryEnderecoDelete: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'DELETE FROM endereco'
      'WHERE idendereco=:idendereco')
    Left = 280
    Top = 128
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryEnderecoUpdate: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'UPDATE endereco'
      '   SET idpessoa=:idpessoa, '
      '       dscep=:dscep'
      'WHERE idendereco=:idendereco')
    Left = 280
    Top = 72
    ParamData = <
      item
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        Name = 'DSCEP'
        ParamType = ptInput
      end
      item
        Name = 'IDENDERECO'
        ParamType = ptInput
      end>
  end
  object qryEnderecoInsert: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'INSERT INTO public.endereco(idendereco, idpessoa, dscep)'
      'VALUES (:idendereco, :idpessoa, :dscep);')
    Left = 280
    Top = 16
    ParamData = <
      item
        Name = 'IDENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DSCEP'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryPessoaDelete: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'DELETE FROM  pessoa'
      'WHERE idpessoa=:idpessoa')
    Left = 176
    Top = 128
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryPessoaUpdate: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'UPDATE pessoa'
      '   SET  finatureza = :finatureza, '
      #9'dsdocumento = :dsdocumento, '
      #9'nmprimeiro = :nmprimeiro, '
      #9'nmsegundo = :nmsegundo'
      ' WHERE idpessoa=:idpessoa')
    Left = 176
    Top = 72
    ParamData = <
      item
        Name = 'FINATUREZA'
        ParamType = ptInput
      end
      item
        Name = 'DSDOCUMENTO'
        ParamType = ptInput
      end
      item
        Name = 'NMPRIMEIRO'
        ParamType = ptInput
      end
      item
        Name = 'NMSEGUNDO'
        ParamType = ptInput
      end
      item
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryAux: TFDQuery
    Connection = DM.FDConn
    Left = 88
    Top = 136
  end
  object qryEnd: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'SELECT * '
      'FROM endereco'
      'WHERE idpessoa = :idpessoa')
    Left = 568
    Top = 24
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryEndidendereco: TLargeintField
      FieldName = 'idendereco'
      Origin = 'idendereco'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryEndidpessoa: TLargeintField
      FieldName = 'idpessoa'
      Origin = 'idpessoa'
    end
    object qryEnddscep: TWideStringField
      FieldName = 'dscep'
      Origin = 'dscep'
      Size = 15
    end
  end
  object dspEnd: TDataSetProvider
    DataSet = qryEnd
    Left = 576
    Top = 80
  end
  object qryEnderecoPessoaDelete: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'DELETE FROM endereco'
      'WHERE idpessoa=:idpessoa')
    Left = 280
    Top = 216
    ParamData = <
      item
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
  end
  object qryEnderecoIntegPessoaDelete: TFDQuery
    Connection = DM.FDConn
    SQL.Strings = (
      'DELETE FROM endereco_integracao'
      'WHERE idendereco in (SELECT idendereco from ENDERECO'
      '                     WHERE idpessoa = :idpessoa)')
    Left = 280
    Top = 272
    ParamData = <
      item
        Name = 'IDPESSOA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object cdsRetornoCEP: TClientDataSet
    PersistDataPacket.Data = {
      A20000009619E0BD010000001800000005000000000003000000A20003436570
      0100490000000100055749445448020002000F000A4C6F677261646F75726F01
      0049000000010005574944544802000200C8000642616972726F010049000000
      010005574944544802000200C8000A4C6F63616C696461646501004900000001
      0005574944544802000200C80002554601004900000001000557494454480200
      020002000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 208
    object cdsRetornoCEPCep: TStringField
      FieldName = 'Cep'
      Size = 15
    end
    object cdsRetornoCEPLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 200
    end
    object cdsRetornoCEPBairro: TStringField
      FieldName = 'Bairro'
      Size = 200
    end
    object cdsRetornoCEPLocalidade: TStringField
      FieldName = 'Localidade'
      Size = 200
    end
    object cdsRetornoCEPUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
end

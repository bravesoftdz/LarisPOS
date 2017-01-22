unit kategori;

{$mode objfpc}{$H+}

interface

uses
  dOpf, dSQLdbBroker;

type
  TKategori = class
  private
    FId: string;
    FKategori: string;
  published
    property Id: string read FId write FId;
    property Kategori: string read FKategori write FKategori;
  end;

  TPKategori = specialize TdGSQLdbEntityOpf<TKategori>;

implementation

end.


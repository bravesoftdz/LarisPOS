unit model;

{$mode objfpc}{$H+}

interface

uses
  dOpf, dSQLdbBroker;

type

  TBarang = class;
  TKategori = class;
  TPBarang = specialize TdGSQLdbEntityOpf<TBarang>;
  TPKategori = specialize TdGSQLdbEntityOpf<TKategori>;

  { TKategori }

  TKategori = class
  private
    FId: string;
    FKategori: string;
  public
    procedure GetBarangs(ABarang: TPBarang; var AValues: TPBarang.TEntities);
  published
    property Id: string read FId write FId;
    property Kategori: string read FKategori write FKategori;
  end;

  { TBarang }

  TBarang = class
  private
    FId: string;
    FIdKategori: string;
    FIdGolongan: string;
    FBarcode: string;
    FDeskripsi: string;
    FSatuan: string;
    FHppAktif: integer;
    FHppAkhir: integer;
    FHargaJual: integer;
    FRak: string;
    FShelving: string;
    FNomer: integer;
    FStok: integer;
    FMinStok: integer;
    FMaxStok: integer;
    FSupplier: string;
  public
    function GetKategori(AKategori: TPKategori): TKategori;
  published
    property Id: string read FId write FId;
    property Kategori_id: string read FIdKategori write FIdKategori;
    property Golongan_id: string read FIdGolongan write FIdGolongan;
    property Barcode: string read FBarcode write FBarcode;
    property Deskripsi: string read FDeskripsi write FDeskripsi;
    property Satuan: string read FSatuan write FSatuan;
    property Hpp_Aktif: integer read FHppAktif write FHppAktif;
    property Hpp_Akhir: integer read FHppAkhir write FHppAkhir;
    property Harga_Jual: integer read FHargaJual write FHargaJual;
    property Rak: string read FRak write FRak;
    property Shelving: string read FShelving write FShelving;
    property Nomer: integer read FNomer write FNomer;
    property Stok: integer read FStok write FStok;
    property Min_Stok: integer read FMinStok write FMinStok;
    property Max_Stok: integer read FMaxStok write FMaxStok;
    property Supplier: string read FSupplier write FSupplier;
  end;

implementation

{ TKategori }

procedure TKategori.GetBarangs(ABarang: TPBarang; var AValues: TPBarang.TEntities);
begin
  ABarang.Entity.Kategori_id := Self.FId;
  ABarang.Find(AValues, 'kategori_id = :kategori_id');
end;

{ TBarang }

function TBarang.GetKategori(AKategori: TPKategori): TKategori;
begin
  AKategori.Entity.Id := FIdKategori;
  AKategori.Find('id = :id');
  Result := AKategori.Entity;
end;

end.


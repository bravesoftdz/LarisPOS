unit barang;

{$mode objfpc}{$H+}

interface

uses
  dOpf, dSQLdbBroker, kategori;

type

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

  TPBarang = specialize TdGSQLdbEntityOpf<TBarang>;

implementation

{ TBarang }

function TBarang.GetKategori(AKategori: TPKategori): TKategori;
begin
  AKategori.Entity.Id := FIdKategori;
  AKategori.Find('id = :id');
  Result := AKategori.Entity;
end;

end.


unit testkategori;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, model,
  dbutils, dOpf, dSQLdbBroker;

type

  { TTestCaseKategori }

  TTestCaseKategori = class(TTestCase)
  protected
    PBarang: TPBarang;
    conn: TdSQLdbConnector;
    PKategori: TPKategori;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CariBarangDariKategori;
    procedure CariKategoriDariBarang;
  end;

implementation

procedure TTestCaseKategori.CariBarangDariKategori;
var
  barang: TBarang;
  barangs: TPBarang.TEntities;
begin
  barangs := TPBarang.TEntities.Create;

  PKategori.Entity.Id := 'RT';
  AssertTrue(PKategori.Find('id = :id'));
  AssertEquals('ALAT RUMAH TANGGA', PKategori.Entity.Kategori);

  PKategori.Entity.GetBarangs(PBarang, barangs);
  barang := barangs.Items[0];
  AssertEquals('PLU1001', barang.Id);
  AssertEquals('SAPU LANTAI', barang.Deskripsi);
  AssertEquals('RT', barang.Kategori_id);

  barang := barangs.Items[1];
  AssertEquals('PLU1002', barang.Id);
  AssertEquals('GERGAJI', barang.Deskripsi);
  AssertEquals('RT', barang.Kategori_id);

  barangs.Free;
end;

procedure TTestCaseKategori.CariKategoriDariBarang;
begin
  PBarang.Entity.Id := 'PLU1002';
  AssertTrue(PBarang.Find('id = :id'));
  AssertEquals('RT', PBarang.Entity.GetKategori(PKategori).Id);
  AssertEquals('ALAT RUMAH TANGGA', PBarang.Entity.GetKategori(PKategori).Kategori);
end;

procedure TTestCaseKategori.SetUp;
begin
  conn := dbutils.con;
  PBarang := TPBarang.Create(conn, 'barang');
  PKategori := TPKategori.Create(conn, 'kategori');

  PKategori.Entity.Id := 'RT';
  PKategori.Entity.Kategori := 'ALAT RUMAH TANGGA';
  PKategori.Add(False);

  PKategori.Entity.Id := 'RP';
  PKategori.Entity.Kategori := 'ALAT PERUSAHAAN';
  PKategori.Add(False);

  PBarang.Entity.Id := 'PLU1001';
  PBarang.Entity.Deskripsi := 'SAPU LANTAI';
  PBarang.Entity.Kategori_id := 'RT';
  PBarang.Add(False);

  PBarang.Entity.Id := 'PLU1002';
  PBarang.Entity.Deskripsi := 'GERGAJI';
  PBarang.Entity.Kategori_id := 'RT';
  PBarang.Add(False);
end;

procedure TTestCaseKategori.TearDown;
begin
  PKategori.Free;
  PBarang.Free;
  conn.Free;
end;

initialization

  RegisterTest(TTestCaseKategori);
end.


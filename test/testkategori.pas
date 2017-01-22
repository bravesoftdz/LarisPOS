unit testkategori;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, barang, fpcunit, testutils, testregistry, kategori,
  dbutils, dOpf, dSQLdbBroker;

type

  TTestCaseKategori = class(TTestCase)
  protected
    PBarang: TPBarang;
    conn: TdSQLdbConnector;
    PKategori: TPKategori;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TambahBarangDanKategori;
  end;

implementation

procedure TTestCaseKategori.TambahBarangDanKategori;
begin
  PKategori.Entity.Id := 'RT';
  PKategori.Entity.Kategori:= 'ALAT RUMAH TANGGA';

  PBarang.Entity.Id := 'PLU1001';
  PBarang.Entity.Deskripsi := 'SAPU LANTAI';
  PBarang.Entity.Kategori_id := 'RT';
  PBarang.Add(False);

  PBarang.Entity.Id := 'PLU1002';
  PBarang.Entity.Deskripsi := 'GERGAJI';
  PBarang.Entity.Kategori_id := 'RT';
  PBarang.Add(False);

  PBarang.Entity.Id := 'PLU1002';
  AssertTrue(PBarang.Find('id = :id'));
  AssertEquals('RT', PBarang.Entity.GetKategori(PKategori).Id);
  AssertEquals('ALAT RUMAH TANGGA', PBarang.Entity.GetKategori(PKategori).Kategori);
end;

procedure TTestCaseKategori.SetUp;
begin
  conn := dbutils.con;
  PBarang := TPBarang.Create(conn, 'barang');
  PKategori:= TPKategori.Create(conn, 'kategori');
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


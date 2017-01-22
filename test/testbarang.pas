unit testbarang;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, dbutils, barang,
  dOpf, dSQLdbBroker;

type

  { TTestCaseInsertBarang }

  TTestCaseBarang = class(TTestCase)
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  public
    FBarang: TPBarang;
    conn: TdSQLdbConnector;
  published
    procedure TestInsertBarang;
    procedure TestUpdateBarang;
    procedure TestDeleteBarang;
  end;

implementation

procedure TTestCaseBarang.TestInsertBarang;
begin
  FBarang.Entity.Id := 'PLU001';
  FBarang.Entity.Deskripsi := 'TEST BARANG';
  FBarang.Add(False);

  FBarang.Entity.Id := 'PLU002';
  FBarang.Entity.Deskripsi := 'TEST BARANG2';
  FBarang.Add(False);

  FBarang.Entity.Id := 'PLU001';
  FBarang.Find('id = :id');

  AssertEquals('TEST BARANG', FBarang.Entity.Deskripsi);
end;

procedure TTestCaseBarang.TestUpdateBarang;
begin
  FBarang.Entity.Id := 'PLU001';
  FBarang.Entity.Deskripsi := 'TEST BARANG';
  FBarang.Add(False);

  FBarang.Entity.Id := 'PLU001';
  FBarang.Entity.Deskripsi := 'UBAH TEST BARANG';
  FBarang.Modify(False);

  FBarang.Entity.Id := 'PLU002';
  FBarang.Entity.Deskripsi := 'TEST BARANG2';
  FBarang.Add(False);

  FBarang.Entity.Id := 'PLU001';
  FBarang.Find('id = :id');
  AssertEquals('UBAH TEST BARANG', FBarang.Entity.Deskripsi);

  FBarang.Entity.Id := 'PLU002';
  FBarang.Find('id = :id');
  AssertEquals('TEST BARANG2', FBarang.Entity.Deskripsi);
end;

procedure TTestCaseBarang.TestDeleteBarang;
begin
  FBarang.Entity.Id := 'PLU001';
  FBarang.Entity.Deskripsi := 'TEST BARANG';
  FBarang.Add(False);

  FBarang.Entity.Id := 'PLU001';

  AssertTrue(FBarang.Find('id = :id'));

  FBarang.Entity.Id := 'PLU001';
  FBarang.Remove(False);

  FBarang.Entity.Id := 'PLU001';

  AssertFalse(FBarang.Find('id = :id'));
end;

procedure TTestCaseBarang.SetUp;
begin
  conn := dbutils.con;
  FBarang := TPBarang.Create(conn, 'barang');
end;

procedure TTestCaseBarang.TearDown;
begin
  FBarang.Free;
  conn.Free;
end;

initialization

  RegisterTest(TTestCaseBarang);
end.

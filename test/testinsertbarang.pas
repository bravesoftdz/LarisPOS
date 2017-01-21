unit testinsertbarang;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry;

type

  TTestCaseInsertBarang= class(TTestCase)
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHookUp;
  end;

implementation

procedure TTestCaseInsertBarang.TestHookUp;
begin
  AssertTrue('benar', True);
end;

procedure TTestCaseInsertBarang.SetUp;
begin
  //
end;

procedure TTestCaseInsertBarang.TearDown;
begin
  //
end;

initialization

  RegisterTest(TTestCaseInsertBarang);
end.


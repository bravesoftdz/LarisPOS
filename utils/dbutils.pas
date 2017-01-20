unit dbutils;

{$mode objfpc}{$H+}

interface

uses
  dSQLdbBroker, SysUtils, sqldblib, IniFiles, mysql56conn;

function con: TdSQLdbConnector;

implementation

var
  _con: TdSQLdbConnector = nil;

function con: TdSQLdbConnector;
var
  LibLoad: TSQLDBLibraryLoader;
  INI: TIniFile;
begin
  if not Assigned(_con) then
  begin
    INI:= TIniFile.Create(GetAppConfigFile(False));

    _con := TdSQLdbConnector.Create(nil);
    //_con.Logger.Active := True;
    //_con.Logger.FileName := 'OUTPUT.LOG';
    _con.User:= INI.ReadString('DB','UserName', 'larispos');
    _con.Password:= INI.ReadString('DB','Password', 'larispos');
    _con.Database:= INI.ReadString('DB','DatabaseName', 'larispos');
    _con.Host:= INI.ReadString('DB','HostName', '127.0.0.1');

    LibLoad:= TSQLDBLibraryLoader.Create(nil);
    LibLoad.ConnectionType:= INI.ReadString('DB','ConnectionType', 'MySQL 5.6');
    LibLoad.LibraryName:= INI.ReadString('DB', 'LibraryName', '/opt/lampp/lib/libmysqlclient.so.18.0.0');
    LibLoad.LoadLibrary;
  end;
end;

finalization
  FreeAndNil(_con);

end.


unit dbutils;

{$mode objfpc}{$H+}

interface

uses
  dSQLdbBroker, SysUtils, sqldblib, IniFiles, mysql56conn;

function con: TdSQLdbConnector;

implementation

function con: TdSQLdbConnector;
var
  LibLoad: TSQLDBLibraryLoader;
  INI: TIniFile;
  _con: TdSQLdbConnector;
begin
  INI:= TIniFile.Create(GetAppConfigFile(False));

  _con := TdSQLdbConnector.Create(nil);
  //_con.Logger.Active := True;
  //_con.Logger.FileName := 'OUTPUT.LOG';
  _con.User:= INI.ReadString('DB','UserName', 'larispos');
  _con.Password:= INI.ReadString('DB','Password', 'larispos');
  _con.Database:= INI.ReadString('DB','DatabaseName', 'larispos');
  _con.Host:= INI.ReadString('DB','HostName', '127.0.0.1');
  _con.ConnectorType:=INI.ReadString('DB','ConnectionType', 'MySQL 5.6');

  LibLoad:= TSQLDBLibraryLoader.Create(nil);
  LibLoad.ConnectionType:= _con.ConnectorType;
  LibLoad.LibraryName:= INI.ReadString('DB', 'LibraryName', '/opt/lampp/lib/libmysqlclient.so.18.0.0');
  LibLoad.LoadLibrary;

  Result:=_con;
end;

end.


// ================================================================
// 
// Unit uDSProcessMgmtUtils.pas
//
// This unit contains some utilities for being used in process 
// management routines.
//
// Esta unit cont�m utilidades para ser usadas no processo de 
// leitura de mem�ria.
//
// ===============================================================

unit uDSProcessMgmtUtils;

interface

uses
  Windows, SysUtils;

  // Function for checking the process "Dark Souls"
  // Fun��o para checar o processo "Dark Souls"
  function IsDarkSoulsRunning: Boolean;

implementation

function IsDarkSoulsRunning: Boolean;
begin
  Result := FindWindow(nil, 'DARK SOULS') <> 0;
end;


end.

// ================================================================
// 
// Unit uDSProcessMgmtUtils.pas
//
// This unit contains some utilities for being used in process 
// management routines.
//
// Esta unit contém utilidades para ser usadas no processo de 
// leitura de memória.
//
// ===============================================================

unit uDSProcessMgmtUtils;

interface

uses
  Windows, SysUtils;

  // Function for checking the process "Dark Souls"
  // Função para checar o processo "Dark Souls"
  function IsDarkSoulsRunning: Boolean;

implementation

function IsDarkSoulsRunning: Boolean;
begin
  Result := FindWindow(nil, 'DARK SOULS') <> 0;
end;


end.

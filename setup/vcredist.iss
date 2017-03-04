#define vcredist_name			      "Microsoft Visual C++ 2015 Redistributable Update 3 14.0.24215"
#define vcredist_file			      "mfc140u.dll"

#define vcredist32_exe          "vc_redist.x86.exe"
#define vcredist32_title        vcredist_name + " (x86)"
#define vcredist32_productcode  "{69BCE4AC-9572-3271-A2FB-9423BDA36A43}"
#define vcredist32_url          "https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe"

#define vcredist64_exe          "vc_redist.x64.exe"
#define vcredist64_title        vcredist_name + " (x64)"
#define vcredist64_productcode  "{EF1EC6A9-17DE-3DA9-B040-686A1E8A8B04}"
#define vcredist64_url          "https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x64.exe"

[Code]
function InstallVCRedist(): Boolean;
begin
  Result := False;

  if not FileExists( ExpandConstant( '{sys}\{#vcredist_file}' ) ) then begin
  #if Platform == "Win32"
    if not MsiProduct( '{#vcredist32_productcode}' ) then begin
      AddProduct( '{#vcredist32_exe}', '/quiet /norestart', '{#vcredist32_title}', '{#vcredist32_url}', false, false, true );
      Result := True;
    end;
  #endif
  #if Platform == "x64"
    if not MsiProduct( '{#vcredist64_productcode}' ) then begin
      AddProduct( '{#vcredist64_exe}', '/quiet /norestart', '{#vcredist64_title}', '{#vcredist64_url}', false, false, true );
      Result := True;
    end;
  #endif
  end;

end;

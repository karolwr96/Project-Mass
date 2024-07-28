unit uHelpFunctions;

interface


uses
  Controls, Forms, Windows, Classes, Graphics, FireDAC.Comp.Client,
  System.SysUtils, System.IOUtils, uTypes; //uADCompClient;


type THelpFunctions = class
  private
  //
  public
    const PolishSigns : array[0..17] of Char = ('•', '∆', ' ', '£', '—', '”', 'å', 'è', 'Ø', 'π', 'Ê', 'Í', '≥', 'Ò', 'Û', 'ú', 'ü', 'ø');
    const NoPolishSigns : array[0..17] of Char = ('A', 'C', 'E', 'L', 'N', 'O', 'S', 'Z', 'Z', 'a', 'c', 'e', 'l', 'n', 'o', 's', 'z', 'z');

    class function GetSpecialFolder(pFolder : Integer) : string;
    class function GetTemporaryFolder : string;
    class function OpenFile(pPath : string) : Boolean;
    class procedure FocusOnMe(pControl : TWinControl);
    class function CanDeleteRecord(pId : Variant) : Boolean;
    class function FormatFloat2(pValue : Double) : Double;
    class function FormatFloat(pValue : Double; pAccuracy : Integer) : Double;
    class function FormatFloat1(pValue: Double): Double;
    class function FloatToString2(pValue : Double) : string;
    class function FloatToString(pValue : Double; pAccuracy : Integer = -1) : string;
    class function GetApplicationTitleWithVersion : string;
    class function CheckFileSize(pFilePath : string) : Integer;
    class function GetPathToSettings : string;
    class function GetPathToExceptionLog : string;

//    class function DefaultResultRes : TResultRec;

    class procedure CenterFormOnWindow(AForm: TForm; AWindow: HWND);
//    class function InputSearchRec(pIdDataType, pIdKind : Integer; pOnlyActive : Boolean) : TInputSearchRec;
//    class procedure FocusNewRecord(pGrid : TcxGrid; pRecordIndex : Integer; pFocusDetail : Boolean);

    class function WriteStringToRegistry(pRoot : HKEY; pKey, pName, pValue : string) : Boolean;
    class function ReadStringFromRegistry(pRoot : HKEY; pKey, pName : string) : string;
    class function WriteStringToFile(pFilePath : string; pLineIndex : Integer; pValue : string) : Boolean;
    class function ReadStringFromFile(pFilePath : string; pLineIndex : Integer) : string;

    class function GetEnumComPorts(pPorts: TStrings = Nil) : Integer;
    class function DateTimeToStrWihoutSec(pValue : TDateTime) : string;
    class function RemovePolishSigns(pText : string) : string;
    class function GetPathToCameraHelp : string;

    class function GenerateOddString(pText : string; pCount : Integer) : string;
    class function CreateFolderPath(pPath : string) : Boolean;

    class function GetCompName : string;
    class procedure Split(const Delimiter: Byte; Input: TBytes; const Strings: TStrings); overload;
    class procedure Split(pDelimiter: Char; pInput: string; pStrings: TStrings); overload;

    class function CopyAndReplaceFile(pSource, pDest : string) : Boolean;

    class function TerminalGroupMask(pIndex : Integer) : Byte;

    class function AssignToPicture(pPicture : TPicture; pStream : TStream) : Boolean;

    class function RtfToText(const pRTF: string; pReplaceLineFeedWithSpace: Boolean = False): string;

    class function GetDateTimeWithoutSec(pDateTime : TDateTime) : TDateTime;
    class function navFloatToStr(AValue : double; ADec : integer) : string;
    class function FormatCurrencyFloat(pValue: Double): Double;
    class function CopyTxtByte(pTxtIn : string; pLengthByte : Integer; pDifference : Integer = 0): string;
    class function CheckFileNameWithDates(pText : string) : string;

    class procedure PrepareTrans(pTrans : TFDTransaction);
    class procedure PrepareQuery(pQuery : TFDQuery; pTrans : TFDTransaction; pQuerySql : string);
    class procedure PrepareProc(pProc : TFDStoredProc; pTrans : TFDTransaction; pProcName : string);
    class procedure SaveLogs(pText, pDirectory : string);
    class procedure DeleteFilesMatchingPattern(pDirectory, pPattern : string);

    class function ChangeStrinToByteTab(pStringToChange : AnsiString ) : TBytes;
    class procedure ClearTabBytesAsBin(var pTab : TByteAsBin);
    class function Byte2Bin(B: Byte): TByteAsBin;

    class procedure DeleteOldDirectory(pFolderPath : string; pDateTo : TDateTime);
    class procedure DeleteAllFilesFrom(pFolderPath : string);

    class procedure FindAllFilesFrom(AFolderPath : string; pResList : TStringList; pExtension : string = '');
    class function FindSubiektBinDirectory(pFolderPath, pDbName : string) : string;
end;


implementation
uses shlobj, shellApi, DateUtils, Math, Variants, StrUtils, ComCtrls,
  Registry, jpeg, uConnectionFb;
//  cxGridCustomTableView, cxGridTableView, cxTextEdit, uConst;
{ THelpFunction }


class procedure THelpFunctions.ClearTabBytesAsBin(var pTab : TByteAsBin);
var I: Integer;
begin
  for I := 0 to Length(pTab) - 1 do pTab[I] := False;
end;

class procedure THelpFunctions.PrepareProc(pProc : TFDStoredProc; pTrans : TFDTransaction; pProcName : string);
begin
  if pProc.Active then pProc.Close;

  pProc.Connection := pTrans.Connection;
  pProc.Transaction := pTrans;
  if pProcName <> '' then begin
    pProc.StoredProcName := pProcName;
    pProc.Prepare;
  end;
end;


class procedure THelpFunctions.PrepareQuery(pQuery : TFDQuery; pTrans : TFDTransaction; pQuerySql : string);
begin
  if pQuery.Active then pQuery.Close;

  pQuery.Connection := pTrans.Connection;
  pQuery.Transaction := pTrans;
  if pQuerySql <> '' then begin
    pQuery.SQL.Text := pQuerySql;
    pQuery.Prepare;
  end;
end;

class procedure THelpFunctions.PrepareTrans(pTrans : TFDTransaction);
begin
  pTrans.Connection := TConnectionFb.Instance.Connection;
  pTrans.Options.AutoCommit := False;
  pTrans.Options.AutoStop := False;
end;

class function THelpFunctions.CopyTxtByte(pTxtIn : string; pLengthByte : Integer; pDifference : Integer = 0): string;
// pTxtIn - tekst wejsciowy; pLengthByte - maksymalna d≥ugoúÊ w bajtach; pDifference = 0 - parametr dodatkowy wykoøystywany do oobliczeÒ
var
  txtTmp : string;
begin
  txtTmp := Copy(pTxtIn, 1, pLengthByte - pDifference);
  if TEncoding.UTF8.GetByteCount(txtTmp) > pLengthByte then begin
    Result := CopyTxtByte(pTxtIn, pLengthByte, pDifference + 1);
  end else begin
    Result := txtTmp;
  end;
end;

class function THelpFunctions.FormatCurrencyFloat(pValue: Double): Double;
begin
//  Result := SimpleRoundTo(SimpleRoundTo(pValue, -3), -2);
  Result := SimpleRoundTo(pValue, -2);
end;

class function THelpFunctions.navFloatToStr(AValue : double; ADec : integer) : string;
begin
  Result := FloatToStrF(AValue, ffFixed, 15, ADec);
end;

class function THelpFunctions.GetDateTimeWithoutSec(pDateTime : TDateTime) : TDateTime;
var yearTmp, monthTmp, dayTmp, hourTmp, minTmp, secTmp, mSecTmp : Word;
begin
  DecodeDateTime(pDateTime, yearTmp, monthTmp, dayTmp, hourTmp, minTmp, secTmp, mSecTmp);
  Result := EncodeDateTime(yearTmp, monthTmp, dayTmp, hourTmp, minTmp, 0, 0);
end;

class function THelpFunctions.AssignToPicture(pPicture : TPicture; pStream: TStream): Boolean;
var J : TJPEGImage;
begin
  Result := False;
  J := TJPEGImage.Create;
  Try
    Try
      pStream.Position := 0;
      if pStream.Size > 0 then begin
        J.LoadFromStream(pStream);
        pPicture.Assign(J);
        Result := True;
      end;
    Except
      //
    End;
  Finally
    J.Free;
  End;
end;

class function THelpFunctions.Byte2Bin(B: Byte): TByteAsBin;
var I : Integer;
    Res : TByteAsBin;
begin
  for I := 7 downto 0 do
    if (B and (1 shl i)) > 0 then Res[I] := True
                             else Res[I] := False;
  Result := Res;
end;

class function THelpFunctions.CanDeleteRecord(pId: Variant): Boolean;
begin
  Result := True;
  if VarIsNull(pId) then Exit;
//  if (pId >= TConst.SystemMinID) and (pId <= TConst.SystemMaxID) then Result := False;
end;

class procedure THelpFunctions.CenterFormOnWindow(AForm: TForm; AWindow: HWND);
var
  formRect, targetRect : TRect;
  x, y : integer;
begin
  GetWindowRect(AForm.Handle, formRect);
  GetWindowRect(AWindow, targetRect);

  x := ((targetRect.Right -targetRect.Left) -(formRect.Right -formRect.Left)) div 2;
  y := ((targetRect.Bottom -targetRect.Top) -(formRect.Bottom -formRect.Top)) div 2;

  AForm.SetBounds( targetRect.Left +x, targetRect.Top +y, AForm.Width, AForm.Height );
end;

class function THelpFunctions.ChangeStrinToByteTab(
  pStringToChange: AnsiString): TBytes;
var
  sTab : TBytes;
  i : integer;
begin
  SetLength(sTab,length(pStringToChange));
  if length(sTab) > 0 then begin
    for i := 1 to Length(pStringToChange)  do begin
      sTab[i-1] := Ord(pStringToChange[i]);
    end;
  end
  else begin
    setLength(sTab,1);                                                          // gdyby string by≥ pusty zwÛrci spacje
    sTab[0] := $20;
  end;
    Result := sTab;
end;

class function THelpFunctions.CheckFileSize(pFilePath: string): Integer;
var fileStream : TFileStream;
begin
  Result := 0;
  Try
    if FileExists(pFilePath) then begin
      fileStream := TFileStream.Create(pFilePath, fmOpenRead);
      Result := Round(fileStream.Size/1024);
      fileStream.Free;
    end;
  Except
    //
  End;
end;

class function THelpFunctions.CheckFileNameWithDates(pText: string): string;
begin
  Result := StringReplace(pText, '/', '-', [rfReplaceAll]);
end;

class function THelpFunctions.CopyAndReplaceFile(pSource, pDest: string) : Boolean;
begin
  Result := False;
  if (not FileExists(pSource)) then Exit;
  Try
    if FileExists(pDest) then DeleteFile(pDest);
    Result := CopyFile(PChar(pSource), PChar(pDest), False);
  Except
    //
  End;
end;

class function THelpFunctions.CreateFolderPath(pPath: string): Boolean;
var i, ost : integer;
begin
  try
    if DirectoryExists(pPath) then begin
      result := true;
    end else begin
      if pPath[length(pPath)] = PathDelim then pPath := copy(pPath, 1, length(pPath) - 1);

      ost := 0;
      for i := 1 to length(pPath) do
        if pPath[i] = PathDelim then ost := i;

      if ost > 0 then result := CreateFolderPath(copy(pPath, 1, ost - 1))
                 else result := false;

      if result then result := CreateDir(pPath);
    end;
  except
    result := false;
  end;
end;

class function THelpFunctions.DateTimeToStrWihoutSec(pValue: TDateTime): string;
begin
  DateTimeToString(Result, 'ddddd t', pValue);
end;

class procedure THelpFunctions.DeleteAllFilesFrom(pFolderPath : string);
var rec : TSearchRec;
    found : integer;
begin
  if Trim(pFolderPath) = '' then Exit;
  pFolderPath := IncludeTrailingPathDelimiter(Trim(pFolderPath));
  if (not DirectoryExists(pFolderPath)) then Exit;

  Found := FindFirst(pFolderPath + '*.*', faAnyFile, rec);

  try
    while found = 0 do begin
      Try
        DeleteFile(pFolderPath + rec.Name);
      Except
        //
      End;
      Found := FindNext(rec);
    end;
  finally
    FindClose(Rec);
  end;
end;

class procedure THelpFunctions.DeleteFilesMatchingPattern(pDirectory, pPattern : string);
var fileName : string;
begin
  for fileName in TDirectory.GetFiles(pDirectory, Trim(pPattern)) do TFile.Delete(fileName);
  if TDirectory.IsEmpty(pDirectory) then TDirectory.Delete(pDirectory);
end;

class procedure THelpFunctions.DeleteOldDirectory(pFolderPath: string;
  pDateTo: TDateTime);
var rec : TSearchRec;
    found : integer;
    yearTmp, monthTmp, dayTmp : Integer;
    textTmp : string;
    dateTmp : TDateTime;
begin
  if Trim(pFolderPath) = '' then Exit;
  pFolderPath := IncludeTrailingPathDelimiter(Trim(pFolderPath));
  if (not DirectoryExists(pFolderPath)) then Exit;

  Found := FindFirst(pFolderPath + '*.*', faAnyFile, rec);
  try
    while found = 0 do begin
      if (rec.Name <> '.') and (rec.Name <> '..') then begin
        Try
          if Length(rec.Name) >= 10 then begin
            textTmp := Copy(rec.Name, 1, 4);
            TryStrToInt(textTmp, yearTmp);
            textTmp := Copy(rec.Name, 6, 2);
            TryStrToInt(textTmp, monthTmp);
            textTmp := Copy(rec.Name, 9, 2);
            TryStrToInt(textTmp, dayTmp);
            dateTmp := EncodeDate(yearTmp, monthTmp, dayTmp);

            if (pDateTo > dateTmp) then begin
              DeleteAllFilesFrom(pFolderPath + rec.Name);
              Try
                RemoveDir(pFolderPath + rec.Name);
              Except
                //
              End;
            end;
          end;
        Except
          //
        End;
      end;
      Found := FindNext(rec);
    end;
  finally
    FindClose(Rec);
  end;
end;

//class function THelpFunctions.DefaultResultRes: TResultRec;
//begin
//  Result.Value := 0;
//  Result.Info := '';
//  Result.IsOk := False;
//  Result.InfoDel := '';
//  Result.ValueVariant := NULL;
//end;

class procedure THelpFunctions.FindAllFilesFrom(AFolderPath: string;
  pResList: TStringList; pExtension: string);
var rec : TSearchRec;
    found : integer;
begin
  pResList.Clear;
  if Trim(AFolderPath) = '' then Exit;
  AFolderPath := IncludeTrailingPathDelimiter(Trim(AFolderPath));
  if (not DirectoryExists(AFolderPath)) then Exit;

  Found := FindFirst(AFolderPath + '*.*', faAnyFile, rec);

  while found = 0 do begin
    if ((pExtension = '') or (CompareText(pExtension, ExtractFileExt(rec.Name)) = 0)) then begin
      pResList.Add(AFolderPath + rec.Name);
    end;
    Found := FindNext(rec);
  end;
end;

class function THelpFunctions.FindSubiektBinDirectory(pFolderPath,
  pDbName: string): string;
var rec : TSearchRec;
    found : integer;
begin
  Result := '';

  pFolderPath := IncludeTrailingPathDelimiter(Trim(pFolderPath));
  if (not DirectoryExists(pFolderPath)) then Exit;

  Found := FindFirst(pFolderPath + '*', faDirectory, rec);

  while found = 0 do begin
    if ContainsText(rec.Name, pDbName) then begin
      Result := rec.Name;
      Break;
    end;
    Found := FindNext(rec);
  end;
end;

class function THelpFunctions.FloatToString(pValue: Double; pAccuracy : Integer): string;
begin
  if pAccuracy > -1 then begin
    Result := FloatToStrF(pValue, ffFixed, 15, pAccuracy);
  end else begin
    Result := FloatToStr(pValue);
  end;
end;

class function THelpFunctions.FloatToString2(pValue: Double): string;
begin
  Result := FloatToStrF(pValue, ffFixed, 15, 2);
end;

//class procedure THelpFunctions.FocusNewRecord(pGrid: TcxGrid; pRecordIndex : Integer; pFocusDetail : Boolean);
//var index, I : Integer;
//    recordTmp : TcxCustomGridRecord;
//begin
//  //zaznaczenie ewentualnego detaila
//  if (pGrid.FocusedView.IsMaster) and (pFocusDetail) then begin
//    index := pGrid.FocusedView.DataController.GetFocusedRecordIndex;
//    if index > -1 then begin
//      if pGrid.FocusedView is TcxGridTableView then begin
//        recordTmp := (pGrid.FocusedView as TcxGridTableView).ViewData.GetRecordByIndex(index);
//        if recordTmp <> Nil then begin
//          if not recordTmp.Expanded then begin
//            recordTmp.Expand(False);
//            recordTmp := recordTmp.GetFirstFocusableChild;
//            if recordTmp <> Nil then begin
//              recordTmp.Focused := True;
//            end;
//          end;
//        end;
//      end;
//    end;
//  end;
//  //zaznaczenie rekordu
//  if (pRecordIndex > -1) and (pGrid.FocusedView.DataController.RecordCount > pRecordIndex) then begin
//    pGrid.FocusedView.DataController.FocusedRecordIndex := pRecordIndex;
//  end;
//  //zaznaczenie pierwszej kolumny
//  if pGrid.FocusedView is TcxGridTableView then begin
//    for I := 0 to (pGrid.FocusedView as TcxGridTableView).ColumnCount - 1 do begin
//      if (pGrid.FocusedView as TcxGridTableView).Columns[I].Properties is TcxTextEditProperties then begin
//        (pGrid.FocusedView as TcxGridTableView).Columns[I].FocusWithSelection;
//        Break;
//      end;
//    end;
//  end;
//  pGrid.SetFocus;
//end;

class procedure THelpFunctions.FocusOnMe(pControl: TWinControl);
begin
  if pControl.CanFocus then pControl.SetFocus;
end;

class function THelpFunctions.FormatFloat(pValue: Double;
  pAccuracy: Integer): Double;
begin
  Result := StrToFloat(FloatToStrF(pValue, ffFixed, 15, pAccuracy));
end;

class function THelpFunctions.FormatFloat1(pValue: Double): Double;
begin
  Result := StrToFloat(FloatToStrF(pValue, ffFixed, 15, 1));
end;

class function THelpFunctions.FormatFloat2(pValue: Double): Double;
begin
  Result := StrToFloat(FloatToStrF(pValue, ffFixed, 15, 2));
end;

class function THelpFunctions.GenerateOddString(pText : string; pCount : Integer): string;
var I, lenghtTmp: Integer;
begin
  Result := '';
  lenghtTmp := Length(pText);
  if lenghtTmp <= 0 then Exit;
  for I := 1 to lenghtTmp do begin
    if (I mod 2) = 0 then begin
      Result := Result + pText[I];
    end else begin
      Result := Result + pText[lenghtTmp - I];
    end;
  end;
  Result := LeftStr(Result, pCount);
end;

class function THelpFunctions.GetApplicationTitleWithVersion: string;
var InfoSize, Wnd     : DWORD;
    VerBuf            : Pointer;
    FI                : PVSFixedFileInfo;
    VerSize           : DWORD;
    VersionH,VersionL, V1, V2, V3, V4 : Integer;
begin
  Result := Application.Title;// MainForm.Caption;
  Try
    InfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Wnd);
    if InfoSize <> 0 then begin
       GetMem(VerBuf, InfoSize);
       VersionH := 0;
       VersionL := 0;
       Try
         if GetFileVersionInfo(PChar(ParamStr(0)), Wnd, InfoSize, VerBuf) then begin
           if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then begin
             VersionH := FI.dwFileVersionMS;
             VersionL := FI.dwFileVersionLS;
           end;
         end;
       Finally
         FreeMem(VerBuf);
       End;
       V1 := ($FFFF0000 and VersionH) shr 16;
       V2 :=  $0000FFFF and VersionH;
       V3 := ($FFFF0000 and VersionL) shr 16;
       V4 :=  $0000FFFF and VersionL;
    end else begin
      V1 := High(SmallInt);
      V2 := V1;
      V3 := V1;
      V4 := V1;
    end;
    Result := Result + Format(' - %d.%d.%d.%d', [V1, V2, V3, V4]);
  Except
    //
  End;
end;

class function THelpFunctions.GetCompName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then Result := buffer
  else Result := '';
end;

class function THelpFunctions.GetEnumComPorts(pPorts: TStrings): Integer;
var
  KeyHandle: HKEY;
  ErrCode, Index: Integer;
  ValueName, Data: string;
  ValueLen, DataLen, ValueType: DWORD;
  TmpPorts: TStringList;
begin
  Result := 0;

  ErrCode := RegOpenKeyEx(
    HKEY_LOCAL_MACHINE,
    'HARDWARE\DEVICEMAP\SERIALCOMM',
    0,
    KEY_READ,
    KeyHandle);

  if ErrCode <> ERROR_SUCCESS then Exit;

  TmpPorts := TStringList.Create;
  try
    try
      Index := 0;
      repeat
        ValueLen := 256;
        DataLen := 256;
        SetLength(ValueName, ValueLen);
        SetLength(Data, DataLen);
        ErrCode := RegEnumValue(
          KeyHandle,
          Index,
          PChar(ValueName),
          Cardinal(ValueLen),
          nil,
          @ValueType,
          PByte(PChar(Data)),
          @DataLen);

        if ErrCode = ERROR_SUCCESS then begin
          SetLength(Data, DataLen - 1);
          TmpPorts.Add(Data);
          Inc(Index);
        end else
          if ErrCode <> ERROR_NO_MORE_ITEMS then Exit;

      until (ErrCode <> ERROR_SUCCESS);

      TmpPorts.Sort;
      if pPorts <> Nil then pPorts.Assign(TmpPorts);

      Result := TmpPorts.Count;
    except
      //
    end;
  finally
    RegCloseKey(KeyHandle);
    TmpPorts.Free;
  end;
end;

class function THelpFunctions.GetPathToCameraHelp: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'cameraHelp\CameraHelpFile.exe';
end;

class function THelpFunctions.GetPathToExceptionLog: string;
begin
  {$IFDEF DEV_TESTING_ONLY}
    Result := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + 'logs\' + TConst.FileNameExceptions;
  {$ELSE}
//    Result := IncludeTrailingPathDelimiter(GetSpecialFolder(CSIDL_COMMON_APPDATA)) + 'GS Software\GS RenBetViewer\logs\' + TConst.FileNameExceptions;
  {$ENDIF}
end;

class function THelpFunctions.GetPathToSettings: string;
begin
  {$IFDEF DEV_TESTING_ONLY}
    Result := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0)));
  {$ELSE}
    Result := IncludeTrailingPathDelimiter(GetSpecialFolder(CSIDL_COMMON_APPDATA)) + 'GS Software\GS RenBetViewer\';
  {$ENDIF}
end;

class function THelpFunctions.GetSpecialFolder(pFolder: Integer): string;
var FilePath: array[0..1023] of char;
begin
  SHGetSpecialFolderPath(0, FilePath, pFolder, False);
  Result := IncludeTrailingPathDelimiter(FilePath);
end;

class function THelpFunctions.GetTemporaryFolder: string;
begin
  Result := GetSpecialFolder(CSIDL_INTERNET_CACHE);
end;

//class function THelpFunctions.InputSearchRec(pIdDataType,
//  pIdKind: Integer; pOnlyActive : Boolean): TInputSearchRec;
//begin
//  Result.IdDataType := pIdDataType;
//  Result.IdKind := pIdKind;
//  Result.OnlyActive := pOnlyActive;
//end;

class function THelpFunctions.OpenFile(pPath: string) : Boolean;
begin
  Result := False;
  if FileExists(pPath) then begin
    Try
      ShellExecute(0, 'open', PChar(pPath), Nil, Nil, SW_SHOWNORMAL);
      Result := True;
    Except
      //
    End;
  end;
end;

class function THelpFunctions.ReadStringFromFile(pFilePath: string; pLineIndex : Integer): string;
var strList : TStringList;
begin
  Result := '';
  if FileExists(pFilePath) then begin
    strList := TStringList.Create;
    Try
      Try
        strList.LoadFromFile(pFilePath);
        if strList.Count > pLineIndex then begin
          Result := Trim(strList[pLineIndex]);
        end;
      Except
        Result := '';
      End;
    Finally
      strList.Free;
    End;
  end;
end;

class function THelpFunctions.ReadStringFromRegistry(pRoot: HKEY; pKey,
  pName: string): string;
var reg : TRegistry;
begin
  Result := '';

  reg := TRegistry.Create;
  reg.RootKey := pRoot;
  Try
    Try
      if reg.OpenKeyReadOnly(pKey) then begin
        Result := Trim(reg.ReadString(pName));
      end;
    Except
      Result := '';
    End;
  Finally
    reg.CloseKey;
    reg.Free;
  End;
end;

class function THelpFunctions.RemovePolishSigns(pText: string): string;
var I, J : Integer;
begin
  for I := 1 to Length(pText) do begin
    for J := 0 to Length(THelpFunctions.PolishSigns) - 1 do begin
      if pText[I] = THelpFunctions.PolishSigns[J] then begin
        pText[I]:= THelpFunctions.NoPolishSigns[J];
        Break;
      end;
    end;
  end;
  Result := pText;
end;

class function THelpFunctions.RtfToText(const pRTF: string;
  pReplaceLineFeedWithSpace: Boolean): string;
var RTFConverter: TRichEdit;
    MyStringStream: TStringStream;
begin
  try
    RTFConverter := TRichEdit.CreateParented(HWND_MESSAGE);
    try
      MyStringStream := TStringStream.Create(pRTF);
      RTFConverter.Lines.LoadFromStream(MyStringStream);
      RTFConverter.PlainText := True;
      RTFConverter.Lines.StrictDelimiter := True;
      if pReplaceLineFeedWithSpace then RTFConverter.Lines.Delimiter := ' '
                                   else RTFConverter.Lines.Delimiter := #13;
      Result := RTFConverter.Lines.DelimitedText;
    finally
      MyStringStream.Free;
    end;
  finally
    RTFConverter.Free;
  end;
end;

class procedure THelpFunctions.Split(const Delimiter: Byte; Input: TBytes;
  const Strings: TStrings);
var delimTmp : Char;
    inputTmp : AnsiString;
    I: Integer;
begin
  delimTmp := Chr(Delimiter);
  inputTmp := '';
  for I := 0 to Length(Input) - 1 do begin
    inputTmp := inputTmp + Chr(Input[I]);
  end;
  Split(delimTmp, inputTmp, Strings);
end;

class procedure THelpFunctions.SaveLogs(pText, pDirectory: string);
var pathToFile, logFolder : string;
  dateTmp : TDateTime;
  fileTmp : TextFile;
begin
  if (pDirectory = '') then Exit;
  dateTmp := Now;

  try
    logFolder := IncludeTrailingPathDelimiter(Trim(pDirectory)) + IntToStr(YearOf(dateTmp)) + '\';
    logFolder := IncludeTrailingPathDelimiter(logFolder) + (FormatDateTime('yyyy-mm', dateTmp)) + '\';
    if not DirectoryExists(logFolder) then CreateFolderPath(logFolder);

    if DirectoryExists(logFolder) then begin
      pathToFile := IncludeTrailingPathDelimiter(logFolder) + THelpFunctions.CheckFileNameWithDates(FormatDateTime('yyyy-mm-dd', dateTmp)) + '.log';
      if (not FileExists(pathToFile)) then begin
        Try
          AssignFile(fileTmp, pathToFile);
          ReWrite(fileTmp);
          CloseFile(fileTmp);
        Except
          //
        End;
      end;

      if (FileExists(pathToFile)) then begin
        AssignFile(fileTmp, pathToFile);
        Try
          Try
            Append(fileTmp);
            Writeln(fileTmp, FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', dateTmp) + ' ' + pText);
            Flush(fileTmp);
          Except
            //
          End;
        Finally
          Try
            CloseFile(fileTmp);
          Except
            //
          End;
        End;
      end;
    end;
  finally

  end;

end;

class procedure THelpFunctions.Split(pDelimiter: Char; pInput: string;
  pStrings: TStrings);
begin
  pStrings.Clear;
  pStrings.Delimiter := pDelimiter;
  pStrings.LineBreak := #0;
  pStrings.QuoteChar := #0;
  pStrings.StrictDelimiter := True;
  pStrings.DelimitedText := pInput;

//  ExtractStrings([pDelimiter], [], PWideChar(pInput), pStrings);
end;

class function THelpFunctions.TerminalGroupMask(pIndex: Integer): Byte;
begin
  Result := 0;
  case pIndex of
    1 : Result := $01;
    2 : Result := $02;
    3 : Result := $04;
    4 : Result := $08;
    5 : Result := $10;
    6 : Result := $20;
    7 : Result := $40;
    8 : Result := $80;
  end;
end;

class function THelpFunctions.WriteStringToFile(pFilePath: string;
  pLineIndex : Integer; pValue: string): Boolean;
var strList : TStringList;
  I: Integer;
begin
  Result := False;
  strList := TStringList.Create;
  Try
    Try
      if FileExists(pFilePath) then begin
        strList.LoadFromFile(pFilePath);
      end;
      if strList.Count <= pLineIndex then begin
        for I := 0 to pLineIndex - strList.Count do begin
          strList.Append('');
        end;
      end;
      if strList.Count > pLineIndex then begin
        strList[pLineIndex] := pValue;
        strList.SaveToFile(pFilePath);
        Result := True;
      end;
    Except
      Result := False;
    End;
  Finally
    strList.Free;
  End;
end;

class function THelpFunctions.WriteStringToRegistry(pRoot : HKEY; pKey, pName, pValue : string): Boolean;
var reg : TRegistry;
begin
  Result := False;

  reg := TRegistry.Create;
  reg.RootKey := pRoot;
  Try
    Try
      if reg.OpenKey(pKey, True) then begin
        reg.WriteString(pName, pValue);
        Result := True;
      end;
    Except
      Result := False;
    End;
  Finally
    reg.CloseKey;
    reg.Free;
  End;
end;

end.

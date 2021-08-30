unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPort, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    ComPort1: TComPort;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  s,t,u,v,w,x : Tstringlist;
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
begin
  Comport1.ShowSetupDialog;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Button2.Caption = 'Connect' then
  begin
    Button2.Caption := 'Disconnect';
    Comport1.Open;
    Statusbar1.Panels[0].Text := Comport1.Port + ' Connected';
  end
  else if Button2.Caption = 'Disconnect' then
  begin
    Button2.Caption := 'Connect';
    Comport1.Close;
    Statusbar1.Panels[0].Text := Comport1.Port + ' Disonnected';
    s.Clear; t.Clear; u.Clear; v.Clear; w.Clear; x.Clear;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Statusbar1.Panels[1].Text := FormatDateTime('dd/mm/yyyy',date);
  Statusbar1.Panels[2].Text := FormatDateTime('hh : nn : ss',time);
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  datamasuk,dataA,dataB,dataC,dataD,dataE,dataF : string;
begin
  repeat
  begin
    Comport1.ReadStr(datamasuk,1);
    dataA := dataA + datamasuk;
  end;
  until datamasuk = 'A';
  s := tstringlist.Create;
  s.Delimiter := 'A';
  s.DelimitedText := dataA;
  Edit1.Text := s[0];

  repeat
  begin
    Comport1.ReadStr(datamasuk,1);
    dataB := dataB + datamasuk;
  end;
  until datamasuk = 'B';
  t := tstringlist.Create;
  t.Delimiter := 'B';
  t.DelimitedText := dataB;
  Edit2.Text := t[0];

  repeat
  begin
    Comport1.ReadStr(datamasuk,1);
    dataC := dataC + datamasuk;
  end;
  until datamasuk = 'C';
  u := tstringlist.Create;
  u.Delimiter := 'C';
  u.DelimitedText := dataC;
  Edit3.Text := u[0];

  repeat
  begin
    Comport1.ReadStr(datamasuk,1);
    dataD := dataD + datamasuk;
  end;
  until datamasuk = 'D';
  v := tstringlist.Create;
  v.Delimiter := 'D';
  v.DelimitedText := dataD;
  Edit4.Text := v[0];

  repeat
  begin
    Comport1.ReadStr(datamasuk,1);
    dataE := dataE + datamasuk;
  end;
  until datamasuk = 'E';
  w := tstringlist.Create;
  w.Delimiter := 'E';
  w.DelimitedText := dataE;
  Edit5.Text := w[0];

  repeat
  begin
    Comport1.ReadStr(datamasuk,1);
    dataF := dataF + datamasuk;
  end;
  until datamasuk = 'F';
  x := tstringlist.Create;
  x.Delimiter := 'F';
  x.DelimitedText := dataF;
  Edit6.Text := x[0];
end;

end.

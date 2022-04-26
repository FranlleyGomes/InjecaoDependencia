unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  iNota = interface
    ['{7E5B0C06-0A17-42C7-B726-709A88146ABB}']
    function numero: integer;
  end;

  iNotaItens = interface
    ['{755967CC-5122-4BFE-9CB5-5BBB35504DA7}']
    function RetornaNumero: integer;
  end;

  TNota = class(TInterfacedObject, iNota)
  private
  public
    function numero: integer;
  end;

  TNotaItens = class(TInterfacedObject, iNotaItens)
  private
    FNota: iNota;
  public
    constructor create(Nota: iNota);
    function RetornaNumero: integer;
  end;


  // ========================================

  iPessoa = interface
    ['{B3EF2022-057B-4E2C-B9A3-5C9F5AC9AB34}']
    function codigoPessoa: integer;
  end;

  TPessoa = class(TInterfacedObject, iPessoa)
  private
  public
    function codigoPessoa: integer;
  end;

  iCliente = interface
    ['{D34FF5CD-B1BD-44E2-A396-E45F75DD78E8}']
    function RetornaCodigoCliente: integer;
  end;

  TCliente = class(TInterfacedObject, iCliente)
  private
    FCodigoCliente: iPessoa;
  public
    constructor create(codigo: iPessoa);
    function RetornaCodigoCliente: integer;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TNota }

function TNota.numero: integer;
begin
  Result := 10;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Nota: iNota;
  NotaItens: iNotaItens;
begin
  Nota := TNota.create as iNota;
  NotaItens := TNotaItens.create(Nota) as iNotaItens;

  ShowMessage(NotaItens.RetornaNumero.ToString);

end;

{ TNotaItens }

constructor TNotaItens.create(Nota: iNota);
begin
  FNota := Nota;
end;

function TNotaItens.RetornaNumero: integer;
begin
  Result := FNota.numero;
end;



{ TCliente }

constructor TCliente.create(codigo: iPessoa);
begin
 FCodigoCliente := codigo;
end;

function TCliente.RetornaCodigoCliente: integer;
begin
   Result := FCodigoCliente.codigoPessoa;
end;

{ TPessoa }

function TPessoa.codigoPessoa: integer;
begin
   Result := 150;
end;



end.

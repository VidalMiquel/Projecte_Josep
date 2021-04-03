-- "Imports"
with ada.Text_IO; use ada.Text_IO;
with dcola;
with ada.Integer_Text_IO; use ada.Integer_Text_IO;

procedure Main is

   --Declaraci� del subtipus tnom.
   subtype tnom is  String(1 .. 50);
   --Declaraci� del record tjugador.
   type tjugador is record
      nom: tnom;
      l: Natural;
   end record;

   package dcola_tjugador is new dcola(tjugador);
   use dcola_tjugador;

   --M�tode per establir l'enlla� amb el fitxer de lectura.
   procedure obrirFitxer (entrada: in out File_Type) is
   begin
     --Put_Line("Establint l'enlla� amb el fitxer de lectura...");
      open(entrada,In_File, "jugadores.txt");
      --Put_Line("Enlla� establert correctament.");
      New_Line;
   end obrirFitxer;

   --M�tode que relitza el tancament de l'enlla� amb el fitxer de lectura.
   procedure tancarFitxer(entrada: in out File_Type) is
   begin
      --Put_Line("Tancant l'enlla� amb el fitxer de lectura...");
      Close(entrada);
      --Put_Line("Enlla� tancat correctament.");
      New_Line;
   end tancarFitxer;

   --M�tode que realitza la lectura d'una linia des del fitxer i ho
   --emmagatzema a una varibale de tipus tjugador.
   procedure llegirLiniaFitxer (entrada: in File_Type; jugador: out tjugador) is
   begin
      Get_Line(entrada, jugador.nom, jugador.l);
   end llegirLiniaFitxer;

   --M�tode que duu a terme la funcionalitat del problema de Josep.
   procedure tractament (coa: in out cola; numPassades: in Natural) is
      --Declaraci� varibale tjugador per poder relaitzar el
      --tractament correctament.
      jugador: tjugador;
   begin
      --Mentres la coa estigui formada NOM�S per un node, iteram.
      while (not (is_last_item(coa))) loop
         --Recorrem la coa.
         for i in 1 .. numPassades loop
            --Obtenim el jugadro que ocupa la primera posici� dins la coa.
            jugador := coger_primero(coa);
            --Borram el primer jugador de la coa.
            borrar_primero(coa);
            --Inserim el jugador obtingut anteriorment, al final de la coa.
            poner(coa, jugador);
         end loop;
         --Obtenim el guanyador del joc.
         jugador :=coger_primero(coa);
         --Borram el jugador de la coa una vagada realitzada el nombre de
         --passades indicat per teclat.
         borrar_primero(coa);
         Put_Line("El jugador eliminat �s: " &jugador.nom(1 .. jugador.l));
      end loop;
      New_Line;
   end tractament;

   --M�tode que obt� el nombre de passades a realitzar des de teclat.
   procedure obtenirNumeroPassades(numPassades: out Integer) is
      correcte: Boolean:= false;
   begin
      while not correcte loop
         Put("Introdueix el nombre de passades a realitzar: ");
         --Obtenim el nombre de passades a realitzar.
         Get(numPassades);
         New_Line;
         --Comprovaci� de la validesa del nombre de passades a fer.
         if(numPassades < 0) then
            Put_Line("Nombre de passades introduides no v�lid.");
            New_Line;
         else
                  correcte:= True;
         end if;
      end loop;
   end obtenirNumeroPassades;

   --Declaracions de varibales
   coa: cola;
   numPasades: Integer;
   jugador:tjugador;
   fichero_in: File_Type;

begin
   New_Line;
   Put_Line("----------BENVINGUT AL PROBLEMA DE JOSEP----------");
   New_Line;
   --Inicailitaci� de la coa;
   --Put_Line("Inicialitzam la coa buida.");
   cvacia(coa);
   New_Line;
   --Establim l'enlla� amb el fitxer.
   obrirFitxer(fichero_in);
   --Lectura i posterior emmagatzament del jugador llegit dins la coa.
   --Put_Line("Introduim els jugadors llegits des del fitxer dins la coa...");
   New_Line;
   while (not (End_Of_File(fichero_in))) loop
      --Lectura d'un jugador des del fitxer especificat.
      llegirLiniaFitxer(fichero_in, jugador);
      --L'introduim dins la coa.
      poner(coa,jugador);
   end loop;
   New_Line;
   --Tancam l'enlla� amb el fitxer.
   tancarFitxer(fichero_in);
   --Obtenim el nombre de passades a realtzar.
   obtenirNumeroPassades(numPasades);
   --Duim a terme el tractament.
   tractament(coa, numPasades);
   --Obtenim el juganyador del joc.
   jugador := coger_primero(coa);
   --Comporvaci� final.
   borrar_primero(coa);
   if (not esta_vacia(coa)) then
      Put_Line("Error en el funcionament.");
      New_Line;
   else
      Put_Line("EL GUANAYDOR DEL JOC �S: " &jugador.nom (1 .. jugador.l));
      New_Line;
   end if;
 Put_Line("----------------------------------------------------");
end Main;

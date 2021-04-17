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
      open(entrada,In_File, "jugadores.txt");
   end obrirFitxer;

   --M�tode que relitza el tancament de l'enlla� amb el fitxer de lectura.
   procedure tancarFitxer(entrada: in out File_Type) is
   begin
      Close(entrada);
   end tancarFitxer;

   --M�tode que duu a terme la funcionalitat del problema de Josep.
   procedure tractament (coa: in out cola; numPassades: in Natural) is
      --Declaraci� varibale tjugador per poder realitzar el
      --tractament correctament.
      jugador: tjugador;
   begin
      --Mentres la coa NO estigui formada NOM�S per un node, iteram.
      while (not (is_last_item(coa))) loop
         --Recorrem la coa "numPassades" vegades.
         for i in 1 .. numPassades loop
            --Obtenim el jugador* que ocupa la primera posici� dins la coa.
            jugador := coger_primero(coa);
            --Borram el primer jugador de la coa.
            borrar_primero(coa);
            --Inserim el jugador obtingut anteriorment*, al final de la coa.
            poner(coa, jugador);
         end loop;
         --Obtenim el jugador a eliminar de la coa.
         jugador :=coger_primero(coa);
         --Print clarificatiu del jugador eliminat.
         Put_Line("El jugador eliminat �s: " &jugador.nom(1 .. jugador.l));
         --Borram el jugador de la coa una vagada realitzada el nombre de
         --passades indicat per teclat.
         borrar_primero(coa);

      end loop;
      New_Line;
   end tractament;

   --M�tode que obt� el nombre de passades a realitzar des de teclat.
   procedure obtenirNumeroPassades(numPassades: out Integer) is
      --Inicialitzaci� varible controla nombre passades
      --introdu�t �s correcte.
      correcte: Boolean:= false;
   begin
         Put("Introdueix el nombre de passades a realitzar: ");
         --Obtenim el nombre de passades a realitzar.
         Get(numPassades);
         New_Line;
         --Comprovaci� de la validesa del nombre de passades a fer.
      if(numPassades < 0) then
         Put_Line("Nombre de passades introduides no v�lid.");
         New_Line;
         obtenirNumeroPassades(numPassades);
      end if;
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
   cvacia(coa);
   --Establim l'enlla� amb el fitxer.
   obrirFitxer(fichero_in);
   --Lectura i posterior emmagatzament del jugador llegit dins la coa.
   while (not (End_Of_File(fichero_in))) loop
      --Lectura d'un jugador des del fitxer especificat.
      Get_Line(fichero_in, jugador.nom, jugador.l);
      --L'introduim dins la coa.
      poner(coa,jugador);
   end loop;
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

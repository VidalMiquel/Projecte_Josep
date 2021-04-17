--------------------------------------------------------------------------------
--Especificaci� de la implemetaci� de la coa enlla�ada per punters.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
generic 
--Declaraci� com a gen�ric el tipus element. Possibilitant, alhora de la 
--instanciaci� del paquet, la declaraci� del tipus d'element que emmagat-
--zemar� la coa.
   type elem is private;
package dcola is 
------------------------------DECLARACIONS-------------------------------------
--------------------------------------------------------------------------------
--                            PART VISIBLE
--------------------------------------------------------------------------------
   --declaraci� del tipus coa com limited private. 
   type cola is limited private;
   --declaraci� de las excepciones no predefinides del paquet.
   mal_uso: exception;
   espacio_desbordado : exception;
   
   --DECLARACI� DELS PROCEDIMIENTS I FUNCIONS
   
   --declaraci� del procediment cvacia. Duu a terme la inicialitzaci� de la
   --estructura coa passada per par�metre.
   procedure cvacia(qu: out cola);
   --declaraci� del procediment poner. Realitza la insercci� d'un element
   --passat per par�metre de la coa donada.
   procedure poner(qu: in out cola; x: in elem);
   --declaraci� del procediment borrar_primero. Elimina l'element que es troba 
   --apuntat pel punter q de la coa passada per par�metre.
   procedure borrar_primero(qu: in out cola);
   --declaraci� de la funci� coger_primero. Retorna l'element apuntat pel
   --punter q de la coa donada.
   function coger_primero(qu: in cola) return elem;
   --declaraci� de la funci� esta_vacia. Duu a terme la verificaci� de si la
   --coa passada per par�metre est� buida.
   function esta_vacia (qu: in cola) return boolean;
   --declaraci� de la funci� is_last_item. Realitza la verificaci� de si la 
   --coa donada est� formada per un i nom�s un element.
   function is_last_item (qu: in cola) return Boolean;
   
-------------------------------------------------------------------------------
--                             PART PRIVADA
-------------------------------------------------------------------------------
private
   --declaraci� tipus nodo.
   type nodo;
   --declaraci� tipu pnodo (punter a un tipus nodo).
   type pnodo is access nodo;
   --definici� tipus nodo com a registre amb dos camps.
   type nodo is record 
      --camp element del nodo.
      x:elem;
      --punter al seg�ent element de la coa.
      sig: pnodo;
   end record;
   
   --definici� tipus coa com a registre amb dos camps.
   --q: punter al primer element de la coa.
   --p: punter al darrer element de la coa.
   type cola is record
      p, q: pnodo;
   end record;
   
end dcola;

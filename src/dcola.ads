--------------------------------------------------------------------------------
--Especificació de la implemetació de la coa enllaçada per punters.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
generic 
--Declaració com a genèric el tipus element. Possibilitant, alhora de la 
--instanciació del paquet, la declaració del tipus d'element que emmagat-
--zemarà la coa.
   type elem is private;
package dcola is 
------------------------------DECLARACIONS-------------------------------------
--------------------------------------------------------------------------------
--                            PART VISIBLE
--------------------------------------------------------------------------------
   --declaració del tipus coa com limited private. 
   type cola is limited private;
   --declaració de las excepciones no predefinides del paquet.
   mal_uso: exception;
   espacio_desbordado : exception;
   
   --DECLARACIÓ DELS PROCEDIMIENTS I FUNCIONS
   
   --declaració del procediment cvacia. Duu a terme la inicialització de la
   --estructura coa passada per paràmetre.
   procedure cvacia(qu: out cola);
   --declaració del procediment poner. Realitza la insercció d'un element
   --passat per paràmetre de la coa donada.
   procedure poner(qu: in out cola; x: in elem);
   --declaració del procediment borrar_primero. Elimina l'element que es troba 
   --apuntat pel punter q de la coa passada per paràmetre.
   procedure borrar_primero(qu: in out cola);
   --declaració de la funció coger_primero. Retorna l'element apuntat pel
   --punter q de la coa donada.
   function coger_primero(qu: in cola) return elem;
   --declaració de la funció esta_vacia. Duu a terme la verificació de si la
   --coa passada per paràmetre està buida.
   function esta_vacia (qu: in cola) return boolean;
   --declaració de la funció is_last_item. Realitza la verificació de si la 
   --coa donada està formada per un i només un element.
   function is_last_item (qu: in cola) return Boolean;
   
-------------------------------------------------------------------------------
--                             PART PRIVADA
-------------------------------------------------------------------------------
private
   --declaració tipus nodo.
   type nodo;
   --declaració tipu pnodo (punter a un tipus nodo).
   type pnodo is access nodo;
   --definició tipus nodo com a registre amb dos camps.
   type nodo is record 
      --camp element del nodo.
      x:elem;
      --punter al següent element de la coa.
      sig: pnodo;
   end record;
   
   --definició tipus coa com a registre amb dos camps.
   --q: punter al primer element de la coa.
   --p: punter al darrer element de la coa.
   type cola is record
      p, q: pnodo;
   end record;
   
end dcola;

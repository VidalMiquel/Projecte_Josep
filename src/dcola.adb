package body dcola is
   
   -----------------------------------------------------------------------------
   --Mètode que inicialitza la coa. Ambdós punters apunten a NULL.
   procedure cvacia (qu: out cola) is
      q: pnodo renames qu.p;
      p: pnodo renames qu.p;
   begin 
      --El punter q i p apunten INICIALMENT  a NULL.
      q:= null;
      p:= null;   
   end cvacia;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --Mètode que comprova si la coa està buida.
   function esta_vacia (qu: in cola) return boolean is
      q: pnodo renames qu.q;
   begin
      --El q ha d'apuntar a NULL.
      return q = null;
   end esta_vacia;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --Mètode que retorna el primer element de la coa si existeix.
   --En cas contrari, llança una excepció.
   function coger_primero (qu: in cola) return elem is
      q: pnodo renames qu.q;
   begin
      return q.x;
   exception
         when Constraint_Error => raise mal_uso;
   end coger_primero;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --Mètode que afageix un element dins la coa.
   --En cas d'error, llança una excepció.
   procedure poner (qu: in out cola; x: in elem ) is
      q : pnodo renames qu.q;
      p: pnodo renames qu.p;
      r: pnodo;
   begin
      --Intància d'un node.
      r:= new nodo;
      r.all:=(x, null);
      --Cas coa es buida.
      if p = null then
         p:=r;
         q:=r;
      else
         --Cas coa conté almenys un element.
         p.sig:= r;
         p:=r;
      end if;
   exception
         when Storage_Error => raise espacio_desbordado;
   end poner;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --Mètode que elimina el primer element de la coa.
   --En cas d'error, llança una excepció.
   procedure borrar_primero (qu: in out cola) is
      q: pnodo renames qu.q;
      p: pnodo renames qu.p;
   begin
      q:= q.sig;
      if q = null then 
         p:= null;
      end if;
   exception
      when Constraint_Error => raise mal_uso;
   end borrar_primero;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --Mètode que comprova si la coa, està formada per un i només un element.
   --Degut al funcionament de les coes, tan el punter p(final coa) com el 
   --punter q (inici coa) NO han d'apuntar a null , és a dir, han d'apuntar 
   --a un node, i ambdós han d'apuntar al mateix. 
   function is_last_item (qu: in cola) return Boolean is
      q: pnodo renames qu.q;
      p: pnodo renames qu.p;
   begin
      return ( p /= null and then q /= null and then q = p);
   end is_last_item;
   -----------------------------------------------------------------------------
   
end dcola;

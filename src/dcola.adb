package body dcola is
   
   -----------------------------------------------------------------------------
   --M�tode que inicialitza la coa. Ambd�s punters apunten a NULL.
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
   --M�tode que comprova si la coa est� buida.
   function esta_vacia (qu: in cola) return boolean is
      q: pnodo renames qu.q;
   begin
      --El q ha d'apuntar a NULL.
      return q = null;
   end esta_vacia;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --M�tode que retorna el primer element de la coa si existeix.
   --En cas contrari, llan�a una excepci�.
   function coger_primero (qu: in cola) return elem is
      q: pnodo renames qu.q;
   begin
      return q.x;
   exception
         when Constraint_Error => raise mal_uso;
   end coger_primero;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --M�tode que afageix un element dins la coa.
   --En cas d'error, llan�a una excepci�.
   procedure poner (qu: in out cola; x: in elem ) is
      q : pnodo renames qu.q;
      p: pnodo renames qu.p;
      r: pnodo;
   begin
      --Int�ncia d'un node.
      r:= new nodo;
      r.all:=(x, null);
      --Cas coa es buida.
      if p = null then
         p:=r;
         q:=r;
      else
         --Cas coa cont� almenys un element.
         p.sig:= r;
         p:=r;
      end if;
   exception
         when Storage_Error => raise espacio_desbordado;
   end poner;
   -----------------------------------------------------------------------------
   
   
   -----------------------------------------------------------------------------
   --M�tode que elimina el primer element de la coa.
   --En cas d'error, llan�a una excepci�.
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
   --M�tode que comprova si la coa, est� formada per un i nom�s un element.
   --Degut al funcionament de les coes, tan el punter p(final coa) com el 
   --punter q (inici coa) NO han d'apuntar a null , �s a dir, han d'apuntar 
   --a un node, i ambd�s han d'apuntar al mateix. 
   function is_last_item (qu: in cola) return Boolean is
      q: pnodo renames qu.q;
      p: pnodo renames qu.p;
   begin
      return ( p /= null and then q /= null and then q = p);
   end is_last_item;
   -----------------------------------------------------------------------------
   
end dcola;

(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, * CNRS-Ecole Polytechnique-INRIA Futurs-Universite Paris Sud *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(*i $Id$ i*)

(*i*)
open Names
open Term
open Sign
open Vernacexpr
open Topconstr
open Impargs
open Libnames
(*i*)

(* [declare_projections ref name coers params fields] declare projections of
   record [ref] (if allowed) using the given [name] as argument, and put them
   as coercions accordingly to [coers]; it returns the absolute names of projections *)

val declare_projections :
  inductive -> ?kind:Decl_kinds.definition_object_kind -> ?name:identifier ->
  bool list -> manual_explicitation list list -> rel_context -> 
  (name * bool) list * constant option list

val declare_structure : bool (*coinductive?*)-> bool (*infer?*) -> identifier -> identifier -> 
  manual_explicitation list -> rel_context -> (* params *) constr -> (* arity *)
  Impargs.manual_explicitation list list -> rel_context -> (* fields *)
  ?kind:Decl_kinds.definition_object_kind -> ?name:identifier ->
  bool -> (* coercion? *)
  bool list -> (* field coercions *)
  Evd.evar_map ->
  inductive

val definition_structure :
  record_kind * bool (*coinductive?*) * bool(*infer?*)* lident with_coercion * local_binder list *
  (local_decl_expr with_coercion with_notation) list * 
  identifier * constr_expr option -> global_reference

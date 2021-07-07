#! /usr/bin/env python
#=========================================================================
# construct.py
#=========================================================================
# Demo 

import os
import sys

from mflowgen.components import Graph, Step

def construct():

  g = Graph()

  #-----------------------------------------------------------------------
  # Parameters
  #-----------------------------------------------------------------------
  
  adk_name = 'skywater-130nm-adk'
  adk_view = 'view-standard'

  parameters = {
    'construct_path' : __file__,
    'design_name'    : 'RAM8',
    'clock_period'   : 20.0,
    'adk'            : adk_name,
    'adk_view'       : adk_view,
    'topographical'  : True,
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )


  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()


  # Custom steps
  constraints     = Step( this_dir + '/constraints'                     )
  macros     = Step( this_dir + '/macros'                     )
  genlibdb            = Step( 'synopsys-ptpx-genlibdb',          default=True )

  genlibdb_pt            = Step( this_dir + '/synopsys-ptpx-genlibdb-pt' )

  #-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------


  g.add_step( constraints     )
  g.add_step( macros     )
  g.add_step( genlibdb)
  g.add_step(genlibdb_pt)

  # #-----------------------------------------------------------------------
  # # Graph -- Add edges
  # #-----------------------------------------------------------------------
  

  # Connect by name
  g.connect_by_name( adk,             genlibdb) 
  g.connect(constraints.o("constraints.tcl"),      genlibdb.i("design.pt.sdc"))
  g.connect(macros.o("design.spef"),      genlibdb.i("design.spef.gz"))
  g.connect_by_name( macros,              genlibdb           )


  g.connect_by_name( adk,             genlibdb_pt) 
  
  g.connect(constraints.o("constraints.tcl"),      genlibdb_pt.i("design.pt.sdc"))

  g.connect(macros.o("design.spef"),      genlibdb_pt.i("design.spef.gz"))

  g.connect_by_name( macros,              genlibdb_pt           )

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------

  g.update_params( parameters )


  return g

if __name__ == '__main__':
  g = construct()
  g.plot()

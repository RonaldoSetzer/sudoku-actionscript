package setzer.sudoku.core.algorithm 
{
	public class GridGenerator 
	{
		private function return_row( cell:int ):int
		{
			return Math.floor( cell / 9 );
		}
		
		private function return_col( cell:int ):int
		{
			return cell % 9;
		}
		
		private function return_block( cell:int ):int 
		{
			return Math.floor( return_row( cell ) / 3 ) * 3 + Math.floor( return_col( cell ) / 3 );
		}
		
		private function is_possible_row( number:int, row:int, sudoku:Array ):Boolean
		{
			var possible:Boolean = true;
			
			for ( var i:int = 0; i <= 8; ++i ) 
			{
				if ( sudoku[ row*9+i ] == number ) 
				{
					possible = false;
					break;
				}
			}
			
			return possible;
		}
		
		private function is_possible_col( number:int, col:int, sudoku:Array ):Boolean 
		{
			var possible:Boolean = true;
			
			for (var i:int = 0; i < 9; ++i ) 
			{
				if ( sudoku[ col + 9 * i ] == number ) 
				{
					possible = false;
					break;
				}
			}
			
			return possible;
		}
		
		private function is_possible_block( number:int, block:int, sudoku:Array ):Boolean
		{
			var possible:Boolean = true;
			
			for ( var i:int = 0; i < 9; ++i ) 
			{
				if ( sudoku[Math.floor(block/3)*27+i%3+9*Math.floor(i/3)+3*(block%3)] == number ) 
				{
					possible = false;
					break;
				}
			}
			
			return possible;
		}
		
		private function is_possible_number( cell:int, number:int, sudoku:Array ):Boolean
		{
			var row:int = return_row( cell );
			var col:int = return_col( cell );
			var block:int = return_block( cell );
			return is_possible_row( number, row, sudoku ) && is_possible_col( number, col, sudoku) && is_possible_block( number, block, sudoku);
		}
		
		private function is_correct_row( row:int, sudoku:Array ):Boolean
		{
			var right_sequence:Array = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
			var row_temp:Array = [];
			
			for ( var i:int = 0; i < 9; ++i ) 
			{
				row_temp[i] = sudoku[ row*9 + i ];
			}
			
			row_temp.sort();
			
			return row_temp.join() == right_sequence.join();
		}
		
		private function is_correct_col( col:int, sudoku:Array ):Boolean
		{
			var right_sequence:Array = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
			var col_temp:Array = [];
			
			for ( var i:int = 0; i < 9; ++i ) 
			{
				col_temp[i] = sudoku[ col + i * 9 ];
			}
			
			col_temp.sort();
			
			return col_temp.join() == right_sequence.join();
		}
		
		private function is_correct_block( block:int, sudoku:Array ):Boolean 
		{
			var right_sequence:Array = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ];
			var block_temp:Array = [];
			
			for ( var i:int = 0; i < 9; ++i ) 
			{
				block_temp[i] = sudoku[Math.floor(block/3)*27+i%3+9*Math.floor(i/3)+3*(block%3)];
			}
			
			block_temp.sort();
			
			return block_temp.join() == right_sequence.join();
		}
		
		private function is_solved_sudoku( sudoku:Array ):Boolean
		{
			for ( var i:int = 0; i < 9; ++i ) 
			{
				if (!is_correct_block(i,sudoku) || !is_correct_row(i,sudoku) || !is_correct_col(i,sudoku)) 
				{
					return false;
				}
			}
			
			return true;
		}
		
		private function determine_possible_values( cell:int, sudoku:Array ):Array 
		{
			var possible:Array = [];
		
			for ( var i:int = 1; i<=9; ++i ) 
			{
				if ( is_possible_number( cell, i, sudoku ) ) 
				{
					possible.unshift(i);
				}
			}
			
			return possible;
		}
		
		private function determine_random_possible_value( possible:Array, cell:int ):int
		{
			var random_picked:int = Math.floor( Math.random() * possible[cell].length );
			return possible[cell][random_picked];
		}
		
		private function scan_sudoku_for_unique(sudoku):Array 
		{
			var possible:Array = [];
			
			for ( var i:int = 0; i < 81; ++i ) 
			{
				if ( sudoku[i] == 0 ) 
				{
					possible[i] = [];
					possible[i] = determine_possible_values(i,sudoku);
				
					if ( possible[i].length == 0 ) 
					{
						return null;
					}
				}
			}
			
			return possible;
		}
		
		private function remove_attempt( attempt_array:Array, number:int ):Array 
		{
			var new_array:Array = [];
			
			for ( var i:int = 0; i < attempt_array.length; ++i ) 
			{
				if ( attempt_array[i] != number) 
				{
					new_array.unshift( attempt_array[i] );
				}
			}
			
			return new_array;
		}
		
		private function next_random( possible:Array ):int 
		{
			var mai:int = 9;
			var min_choices:int = 0;
			
			for ( var i:int = 0; i < 81; ++i ) 
			{
				if( possible[i] != undefined ) 
				{
					if ( ( possible[i].length <= mai ) && ( possible[i].length > 0 ) ) 
					{
						mai = possible[i].length;
						min_choices = i;
					}
				}
			}
			
			return min_choices;
		}

		public function createSudoku():Array 
		{
			var sudoku:Array = [
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0
			];
			
			var saved:Array = [];
			var saved_sud:Array = [];
			var i:int = 0;
			var next_move:Array;
			var what_to_try:int;
			var attempt:int;
			
			while ( !is_solved_sudoku( sudoku ) ) 
			{
				i+=1;
				
				next_move = scan_sudoku_for_unique( sudoku );
			
				if (next_move == null) 
				{
					next_move = saved.pop();
					sudoku = saved_sud.pop();
				}
				
				what_to_try = next_random( next_move );
				attempt = determine_random_possible_value( next_move,what_to_try );
				
				if ( next_move[ what_to_try ].length > 1 ) 
				{
					next_move[ what_to_try ] = remove_attempt( next_move[ what_to_try ], attempt );
					saved.push( next_move.slice() );
					saved_sud.push( sudoku.slice() );
				}
				sudoku[ what_to_try ] = attempt;
			}
			/*trace( show_sudoku( sudoku ));*/
			
			return sudoku;
		}
		
		public function getEmptyIndex( level:int ):Array
		{
			var levels:Array = [ 35,40,50,55 ];
			var result:Array = [];
			var count:int = 0;
			var rndIndex:int;
			
			while( count < levels[level] )
			{
				rndIndex = Math.floor( Math.random()* 81 );
				
				if ( result.indexOf( rndIndex ) == -1 )
				{
					result.push( rndIndex );
					count++;
				}
			}
			
			return result;
		}
		
		public function show_sudoku( sudoku:Array ):String
		{
			var sudokutext:String = "\n";
			
			for ( var i:int =0; i < 9; ++i ) 
			{
				for ( var j:int = 0; j< 9; ++j ) 
				{
					sudokutext += " ";
					sudokutext += sudoku[i*9+j];
					sudokutext += " ";
					if (j!=8) {
						sudokutext += "|";
					}
				}
				if (i!=8) {
					sudokutext += "\n---+---+---+---+---+---+---+---+---\n";
				}
			}
			return sudokutext; 
		}
	}
}
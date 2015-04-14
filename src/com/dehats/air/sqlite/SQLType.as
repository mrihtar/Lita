package com.dehats.air.sqlite
{
	
    public class SQLType
    {
    	
    	public static const STORAGE_TYPES:Array = [ STORAGE_NULL, STORAGE_INTEGER, STORAGE_REAL, STORAGE_TEXT, STORAGE_BLOB,];
    	public static const AFFINITY_TYPES:Array = [ TEXT, NUMERIC, INTEGER, REAL, DATE, BOOLEAN, XML, XMLLIST, OBJECT, NONE];
    	public static const AFFINITY_TYPES_STRICT:Array = [ TEXT, NUMERIC, INTEGER, REAL, NONE];

		// Storage
        public static const STORAGE_NULL:String = "NULL";    	
        public static const STORAGE_INTEGER:String = "INTEGER";    	
        public static const STORAGE_REAL:String = "REAL";    	
        public static const STORAGE_TEXT:String = "TEXT";
        public static const STORAGE_BLOB:String = "BLOB";    	
	
		// Affinities
        public static const TEXT:String = "TEXT";    	
        public static const NUMERIC:String = "NUMERIC";
        public static const INTEGER:String = "INTEGER";
        public static const REAL:String = "REAL";
        public static const NONE:String = "NONE";        
        
        // AIR Specific affinity types      
        //public static const STRING:String = "STRING"; // equiv to TEXT
        //public static const NUMBER:String = "NUMBER"; // equiv to NUMBER
        public static const BOOLEAN:String = "BOOLEAN";
        public static const DATE:String = "DATE";
        public static const XML:String = "XML";
        public static const XMLLIST:String = "XMLLIST";
        public static const OBJECT:String = "OBJECT";


		public static function getAffinity(pType:String, pAIR:Boolean=true):String
		{
			/*
			# If the data type of the column contains any of the strings "CHAR", "CLOB", "STRI", or "TEXT" then that column has TEXT/STRING affinity. Notice that the type VARCHAR contains the string "CHAR" and is thus assigned TEXT affinity.
			# If the data type for the column contains the string "BLOB" or if no data type is specified then the column has affinity NONE.
			# If the data type for column contains the string "XMLL" then the column has XMLLIST affinity.
			# If the data type is the string "XML" then the column has XML affinity.
			# If the data type contains the string "OBJE" then the column has OBJECT affinity.
			# If the data type contains the string "BOOL" then the column has BOOLEAN affinity.
			# If the data type contains the string "DATE" then the column has DATE affinity.
			# If the data type contains the string "INT" (including "UINT") then it is assigned INTEGER affinity.
			# If the data type for a column contains any of the strings "REAL", "NUMB", "FLOA", or "DOUB" then the column has REAL/NUMBER affinity.
			# Otherwise, the affinity is NUMERIC.
			*/			
			if(pType==null) pType="";

			var dataType:String = pType.toLocaleLowerCase();

			if( dataType.indexOf("int") !=-1) return INTEGER;

			
			if( dataType.indexOf("char") !=-1) return TEXT;
			if( dataType.indexOf("clob") !=-1) return TEXT;
			if( dataType.indexOf("text") !=-1) return TEXT;
			
			if(dataType=="" || dataType=="blob") return NONE;

			if( dataType.indexOf("real") !=-1) return REAL;
			if( dataType.indexOf("floa") !=-1) return REAL;
			if( dataType.indexOf("doub") !=-1) return REAL;
			
			if(pAIR && dataType.indexOf("xmll") !=-1) return XMLLIST;			
			if(pAIR && dataType=="xml" ) return XML;
			if(pAIR && dataType.indexOf("obje") !=-1) return OBJECT;
			if(pAIR && dataType.indexOf("bool") !=-1) return BOOLEAN;
			if(pAIR && dataType.indexOf("numb") !=-1) return REAL;
			if(pAIR && dataType.indexOf("stri") !=-1) return TEXT;
			if(pAIR && dataType.indexOf("date") !=-1) return DATE;
			
			return NUMERIC;

		}

    }
}
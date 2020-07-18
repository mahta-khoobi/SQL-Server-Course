
--Cursor Concept:
--	use for tracing Records
--	=======================
--	Reason of using:
--	Decrease:
--		1-Business Complexity
--		2-Time Complexity
--	========================
--	Syntax:

--	/*
--	DECLARE cursor_name CURSOR
--	[ LOCAL | GLOBAL ]
--	[ FORWARD_ONLY | SCROLL ]
--	[ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]
--	[ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]
--	[ TYPE_WARNING ]
--	FOR select_statement
--	[ FOR UPDATE [ OF column_name [ ,...n ] ] ]
--	*/

Go
--SCROLL:
--	all fetch options (FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE) are available.
Go
--READ ONLY:
--	Prevents updates made through this cursor. 
--	Cannot be referenced in a WHERE CURRENT OF clause in an UPDATE or DELETE statement.
Go 
--LOCAL:
--	scope of the cursor is local to the batch, stored procedure, or trigger in which the cursor was created.
--	The cursor name is only valid within this scope.
--	The cursor can be referenced by local cursor variables in the batch, stored procedure, or trigger, or a stored procedure OUTPUT parameter. 
Go	
--GLOBAL:
--	scope of the cursor is global to the connection. 
--	The cursor name can be referenced in any stored procedure or batch executed by the connection. 
--	The cursor is only implicitly deallocated at disconnect.
--	by Default: (Local)
Go
--FORWARD_ONLY:
--	can only be scrolled from the first to the last row. 
--	FETCH NEXT is the only supported fetch option. 
--	If FORWARD_ONLY is specified without the STATIC, KEYSET, or DYNAMIC keywords, the cursor operates as a DYNAMIC cursor. 
--	When neither FORWARD_ONLY nor SCROLL is specified, FORWARD_ONLY is the default, unless the keywords STATIC, KEYSET, or DYNAMIC are specified.
--	STATIC, KEYSET, and DYNAMIC cursors default to SCROLL.
Go
--STATIC:
--	Defines a cursor that makes a temporary copy of the data to be used by the cursor.
--	All requests to the cursor are answered from this temporary table in tempdb. 
--	Modifications made to base tables are not reflected in the data returned by fetches made to this cursor
--	Does not allow modifications.
Go
--KEYSET:
--	Specifies that the membership and order of rows in the cursor are fixed when the cursor is opened.
--	The set of keys that uniquely identify the rows is built into a table in tempdb known as the keyset.
--	If the query references at least one table without a unique index, the keyset cursor is converted to a static cursor.
--	Changes to nonkey values in the base tables, either made by the cursor owner or committed by other users, 
--		are visible as the owner scrolls around the cursor. 
--	Inserts made by other users are not visible (inserts cannot be made through a Transact-SQL server cursor).
--	If a row is deleted, an attempt to fetch the row returns an @@FETCH_STATUS of -2. 
--	Updates of key values from outside the cursor resemble a delete of the old row followed by an insert of the new row.
--	The row with the new values is not visible, and attempts to fetch the row with the old values return an @@FETCH_STATUS of -2.
--	The new values are visible if the update is done through the cursor by specifying the WHERE CURRENT OF clause.
Go
--DYNAMIC:
--	Defines a cursor that reflects all data changes made to the rows in its result set as you scroll around the cursor. 
--	The data values, order, and membership of the rows can change on each fetch. 
--	The ABSOLUTE fetch option is not supported with dynamic cursors.
Go
--FAST_FORWARD:
--	Specifies a FORWARD_ONLY, READ_ONLY cursor with performance optimizations enabled. 
--	FAST_FORWARD cannot be specified if SCROLL or FOR_UPDATE is also specified.
--	Both FAST_FORWARD and FORWARD_ONLY can be used in the same DECLARE CURSOR statement.
Go
--READ_ONLY:
--	Prevents updates made through this cursor. 
--	Cannot be referenced in a WHERE CURRENT OF clause in an UPDATE or DELETE statement. 
--	This option overrides the default capability of a cursor to be updated.
Go
--SCROLL_LOCKS:
--	Specifies that positioned updates or deletes made through the cursor are guaranteed to succeed. 
--	SQL Server locks the rows as they are read into the cursor to ensure their availability for later modifications. 
--	SCROLL_LOCKS cannot be specified if FAST_FORWARD or STATIC is also specified.
Go
--OPTIMISTIC:
--	Specifies that positioned updates or deletes made through the cursor do not succeed if the row has been updated 
--		since it was read into the cursor. 
--	SQL Server does not lock rows as they are read into the cursor. 
--	It instead uses comparisons of timestamp column values, 
--		or a checksum value if the table has no timestamp column, to determine whether the row was modified after it was read into the cursor. 
--	If the row was modified, the attempted positioned update or delete fails. 
--	OPTIMISTIC cannot be specified if FAST_FORWARD is also specified.
Go
--TYPE_WARNING:
--	warning message is sent to the client when the cursor is implicitly converted from the requested type to another.
Go





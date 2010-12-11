
-- LSST Database Metadata
-- $Revision$
-- $Date$
--
-- See <http://dev.lsstcorp.org/trac/wiki/Copyrights>
-- for copyright information.


DROP DATABASE IF EXISTS lsst_schema_browser_DC3b;
CREATE DATABASE lsst_schema_browser_DC3b;
USE lsst_schema_browser_DC3b;


CREATE TABLE AAA_Version_DC3b_3_2_3 (version CHAR);


CREATE TABLE md_Table (
	tableId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	engine VARCHAR(255),
	description VARCHAR(255)
);

CREATE TABLE md_Column (
	columnId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	tableId INTEGER NOT NULL REFERENCES md_Table (tableId),
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	type VARCHAR(255),
	notNull INTEGER DEFAULT 0,
	defaultValue VARCHAR(255),
	unit VARCHAR(255),
	ucd VARCHAR(255),
        displayOrder INTEGER NOT NULL,
	INDEX md_Column_idx (tableId, name)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 1, name = "AmpMap",
	description = "Mapping table to translate amp names to numbers.";

	INSERT INTO md_Column
	SET columnId = 1, tableId = 1, name = "ampNum",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 2, tableId = 1, name = "ampName",
		type = "CHAR(3)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 2, name = "CalibSource",
	engine = "MyISAM",
	description = "Table to store all sources detected during WCS determination.&#xA;";

	INSERT INTO md_Column
	SET columnId = 3, tableId = 2, name = "calibSourceId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 4, tableId = 2, name = "ccdExposureId",
		description = "Pointer to CcdExposure where this source was measured. Note that we do not allow a source to belong to multiple CcdExposures (it may not span multiple CcdExposures).&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 5, tableId = 2, name = "filterId",
		description = "Pointer to an entry in Filter table: filter used to take the Exposure where this Source was measured.&#xA;",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 6, tableId = 2, name = "astroRefCatId",
		description = "Pointer to the corresponding object from the Astrometric Reference Catalog.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 7, tableId = 2, name = "photoRefCatId",
		description = "Pointer to the corresponding object in the Photometric Reference Catalog.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 8, tableId = 2, name = "ra",
		description = "RA-coordinate of the center of the calibSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 9, tableId = 2, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 10, tableId = 2, name = "decl",
		description = "Decl-coordinate of the center of the calibSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 11, tableId = 2, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 12, tableId = 2, name = "xAstrom",
		description = "x position computed by a centroiding algorithm.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 13, tableId = 2, name = "xAstromSigma",
		description = "Uncertainty of xAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 14, tableId = 2, name = "yAstrom",
		description = "y position computed by a centroiding algorithm.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 15, tableId = 2, name = "yAstromSigma",
		description = "Uncertainty of yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 16, tableId = 2, name = "xyAstromCov",
		description = "Covariance between the xAstrom and the yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 17, tableId = 2, name = "psfFlux",
		description = "Psf flux.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 18, tableId = 2, name = "psfFluxSigma",
		description = "Uncertainty of the psfFlux.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 19, tableId = 2, name = "apFlux",
		description = "Aperture flux. Needed for aperture correction calculation.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 20, tableId = 2, name = "apFluxSigma",
		description = "Uncertainty of apFlux.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 21, tableId = 2, name = "momentIxx",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 22, tableId = 2, name = "momentIxxSigma",
		description = "Uncertainty of momentIxx: sqrt(covariance(x, x))&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 23, tableId = 2, name = "momentIyy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 24, tableId = 2, name = "momentIyySigma",
		description = "Uncertainty of momentIyy: sqrt(covariance(y, y))&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 25, tableId = 2, name = "momentIxy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 26, tableId = 2, name = "momentIxySigma",
		description = "Uncertainty of momentIxy: sqrt(covariance(x, y))&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 27, tableId = 2, name = "flag",
		description = "Flag for capturing various conditions/statuses.",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 28, tableId = 2, name = "_chunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 29, tableId = 2, name = "_subChunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 27;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 3, name = "CcdMap",
	description = "Mapping table to translate ccd names to numbers.";

	INSERT INTO md_Column
	SET columnId = 30, tableId = 3, name = "ccdNum",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 31, tableId = 3, name = "ccdName",
		type = "CHAR(3)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 4, name = "Ccd_Detector",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 32, tableId = 4, name = "ccdDetectorId",
		description = "from file name (required for raw science images)",
		type = "INTEGER",
		notNull = 1,
		defaultValue = "1",
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 33, tableId = 4, name = "biasSec",
		description = "Bias section (ex: '[2045:2108,1:4096]')",
		type = "VARCHAR(20)",
		notNull = 1,
		defaultValue = "'[0:0,0:0]'",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 34, tableId = 4, name = "trimSec",
		description = "Trim section (ex: '[1:2044,1:4096]')",
		type = "VARCHAR(20)",
		notNull = 1,
		defaultValue = "'[0:0,0:0]'",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 35, tableId = 4, name = "gain",
		description = "Detector/amplifier gain",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 36, tableId = 4, name = "rdNoise",
		description = "Read noise for detector/amplifier",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 37, tableId = 4, name = "saturate",
		description = "Maximum data value for A/D converter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 5, name = "DiaSource",
	engine = "MyISAM",
	description = "Table to store high signal-to-noise &quot;sources&quot;. A source is a measurement of  Object's properties from a single image that contains its footprint on the sky.";

	INSERT INTO md_Column
	SET columnId = 38, tableId = 5, name = "diaSourceId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 39, tableId = 5, name = "ccdExposureId",
		description = "Pointer to the CcdExpsoure where this diaSource was measured. Note that we are allowing a diaSource to belong to multiple AmpExposures, but it may not span multiple CcdExposures.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 40, tableId = 5, name = "filterId",
		description = "Pointer to an entry in Filter table: filter used to take Exposure where this diaSource was measured.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 41, tableId = 5, name = "objectId",
		description = "Pointer to Object table. Might be NULL (each diaSource will point to either MovingObject or Object)&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 42, tableId = 5, name = "movingObjectId",
		description = "Pointer to MovingObject table. Might be NULL (each diaSource will point to either MovingObject or Object)&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 43, tableId = 5, name = "ra",
		description = "RA-coordinate of the center of the diaSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 44, tableId = 5, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 45, tableId = 5, name = "decl",
		description = "Decl-coordinate of the center of the diaSource.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 46, tableId = 5, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 47, tableId = 5, name = "xAstrom",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 48, tableId = 5, name = "xAstromSigma",
		description = "Uncertainty of xAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 49, tableId = 5, name = "yAstrom",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 50, tableId = 5, name = "yAstromSigma",
		description = "Uncertainty of yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 51, tableId = 5, name = "xyAstromCov",
		description = "Covariance between the xAstrom and the yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 52, tableId = 5, name = "xOther",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 53, tableId = 5, name = "xOtherSigma",
		description = "Uncertainty of xOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 54, tableId = 5, name = "yOther",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 55, tableId = 5, name = "yOtherSigma",
		description = "Uncertainty of yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 56, tableId = 5, name = "xyOtherCov",
		description = "Covariance between the xOther and yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 57, tableId = 5, name = "astromRefrRa",
		description = "Astrometric refraction in ra.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 58, tableId = 5, name = "astromRefrRaSigma",
		description = "Uncertainty of astromRefrRa.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 59, tableId = 5, name = "astromRefrDecl",
		description = "Astrometric refraction in decl.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 60, tableId = 5, name = "astromRefrDeclSigma",
		description = "Uncertainty of astromRefrDecl.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 61, tableId = 5, name = "sky",
		description = "Sky background.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 62, tableId = 5, name = "skySigma",
		description = "Uncertainty of sky.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 63, tableId = 5, name = "psfLnL",
		description = "ln(likelihood) of being a PSF.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 64, tableId = 5, name = "lnL_SG",
		description = "Log-likelihood of being a Small Galaxy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 65, tableId = 5, name = "flux_PS",
		description = "Calibrated flux for Point Source model.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 66, tableId = 5, name = "flux_PS_Sigma",
		description = "Uncertainty of flux_PS.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 67, tableId = 5, name = "flux_SG",
		description = "Calibrated flux for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 68, tableId = 5, name = "flux_SG_Sigma",
		description = "Uncertainty of flux_SG.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 69, tableId = 5, name = "flux_CSG",
		description = "Calibrated flux for Cannonical Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 70, tableId = 5, name = "flux_CSG_Sigma",
		description = "Uncertainly of flux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 71, tableId = 5, name = "extendedness",
		description = "Probability that this DiaSource is an extended source. Valid range: 0-1, where 1 indicates an extended source with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 72, tableId = 5, name = "galExtinction",
		description = "Galactic extinction.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 73, tableId = 5, name = "apCorrection",
		description = "Photometric correction: aperture correction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 74, tableId = 5, name = "grayExtinction",
		description = "Photometric correction: gray extinction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 75, tableId = 5, name = "nonGrayExtinction",
		description = "Photometric correction: non-gray extinction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 76, tableId = 5, name = "midPoint",
		description = "Corrected midpoint of the exposure (tai).&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 77, tableId = 5, name = "momentIx",
		description = "Adaptive first moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 78, tableId = 5, name = "momentIxSigma",
		description = "Uncertainty of momentIx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 79, tableId = 5, name = "momentIy",
		description = "Adaptive first moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 80, tableId = 5, name = "momentIySigma",
		description = "Uncertainty of momentIy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 81, tableId = 5, name = "momentIxx",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 82, tableId = 5, name = "momentIxxSigma",
		description = "Uncertainty of momentIxx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 83, tableId = 5, name = "momentIyy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 84, tableId = 5, name = "momentIyySigma",
		description = "Uncertainty of momentIyy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 85, tableId = 5, name = "momentIxy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 86, tableId = 5, name = "momentIxySigma",
		description = "Uncertainty of momentIx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 87, tableId = 5, name = "flags",
		description = "Flags.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 88, tableId = 5, name = "_chunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 89, tableId = 5, name = "_subChunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 52;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 6, name = "Durations",
	engine = "MyISAM",
	description = "Per-run durations.";

	INSERT INTO md_Column
	SET columnId = 90, tableId = 6, name = "id",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 91, tableId = 6, name = "RUNID",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 92, tableId = 6, name = "name",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 93, tableId = 6, name = "workerid",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 94, tableId = 6, name = "stagename",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 95, tableId = 6, name = "SLICEID",
		type = "INTEGER",
		notNull = 0,
		defaultValue = "-1",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 96, tableId = 6, name = "duration",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 97, tableId = 6, name = "HOSTID",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 98, tableId = 6, name = "LOOPNUM",
		type = "INTEGER",
		notNull = 0,
		defaultValue = "-1",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 99, tableId = 6, name = "STAGEID",
		type = "INTEGER",
		notNull = 0,
		defaultValue = "-1",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 100, tableId = 6, name = "PIPELINE",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 101, tableId = 6, name = "COMMENT",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 102, tableId = 6, name = "start",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 103, tableId = 6, name = "userduration",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 104, tableId = 6, name = "systemduration",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 15;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 7, name = "Filter",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 105, tableId = 7, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 106, tableId = 7, name = "filterName",
		description = "Filter name. Valid values: 'u', 'g', 'r', 'i', 'z', 'y'&#xA;",
		type = "CHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 107, tableId = 7, name = "photClam",
		description = "Filter centroid wavelength",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 108, tableId = 7, name = "photBW",
		description = "System effective bandwidth",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 8, name = "ForcedSource",
	engine = "MyISAM",
	description = "Forced-photometry source measurement on an individual Exposure based on a Multifit shape model derived from a deep detection.&#xA;";

	INSERT INTO md_Column
	SET columnId = 109, tableId = 8, name = "objectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 110, tableId = 8, name = "visitId",
		description = "Pointer to the entry in Visit table where this forcedSource was measured.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 111, tableId = 8, name = "flux",
		description = "Flux.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 112, tableId = 8, name = "flux_Sigma",
		description = "Uncertainty of flux.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 113, tableId = 8, name = "x",
		description = "x position computed by a centroiding algorithm.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 114, tableId = 8, name = "y",
		description = "y position computed by a centroiding algorithm.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 115, tableId = 8, name = "flags",
		description = "Flags.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 7;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 9, name = "FpaMetadata",
	engine = "MyISAM",
	description = "Focal-plane-related generic key-value pair metadata.&#xA;";

	INSERT INTO md_Column
	SET columnId = 116, tableId = 9, name = "ccdExposureId",
		description = "Id of the corresponding Raw or Science Ccd_Exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 117, tableId = 9, name = "exposureType",
		description = "Meaning of the bits tbd...&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 118, tableId = 9, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 119, tableId = 9, name = "metadataValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 10, name = "LeapSeconds",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 120, tableId = 10, name = "whenJd",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 121, tableId = 10, name = "offset",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 122, tableId = 10, name = "mjdRef",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 123, tableId = 10, name = "drift",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 124, tableId = 10, name = "whenMjdUtc",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 125, tableId = 10, name = "whenUtc",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 126, tableId = 10, name = "whenTai",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 7;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 11, name = "Logs",
	engine = "MyISAM",
	description = "Per-run logs.";

	INSERT INTO md_Column
	SET columnId = 127, tableId = 11, name = "id",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 128, tableId = 11, name = "HOSTID",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 129, tableId = 11, name = "RUNID",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 130, tableId = 11, name = "LOG",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 131, tableId = 11, name = "workerid",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 132, tableId = 11, name = "stagename",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 133, tableId = 11, name = "SLICEID",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 134, tableId = 11, name = "STAGEID",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 135, tableId = 11, name = "LOOPNUM",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 136, tableId = 11, name = "STATUS",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 137, tableId = 11, name = "LEVEL",
		type = "INTEGER",
		notNull = 0,
		defaultValue = "9999",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 138, tableId = 11, name = "DATE",
		type = "VARCHAR(30)",
		notNull = 0,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 139, tableId = 11, name = "TIMESTAMP",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 140, tableId = 11, name = "node",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 141, tableId = 11, name = "custom",
		type = "VARCHAR(4096)",
		notNull = 0,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 142, tableId = 11, name = "timereceived",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 143, tableId = 11, name = "visitid",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 144, tableId = 11, name = "COMMENT",
		type = "TEXT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 145, tableId = 11, name = "PIPELINE",
		type = "VARCHAR(80)",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 146, tableId = 11, name = "TYPE",
		type = "VARCHAR(5)",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 147, tableId = 11, name = "EVENTTIME",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 148, tableId = 11, name = "PUBTIME",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 149, tableId = 11, name = "usertime",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 150, tableId = 11, name = "systemtime",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 24;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 12, name = "MovingObject",
	engine = "MyISAM",
	description = "The movingObject table contains description of the Solar System (moving) Objects.&#xA;";

	INSERT INTO md_Column
	SET columnId = 151, tableId = 12, name = "movingObjectId",
		description = "Moving object unique identified.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 152, tableId = 12, name = "movingObjectVersion",
		description = "Version number for the moving object. Updates to orbital parameters will result in a new version (row) of the object, preserving the orbit refinement history",
		type = "INT",
		notNull = 1,
		defaultValue = "'1'",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 153, tableId = 12, name = "procHistoryId",
		description = "Pointer to ProcessingHistory table.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 154, tableId = 12, name = "taxonomicTypeId",
		description = "Pointer to ObjectType table for asteroid taxonomic type",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 155, tableId = 12, name = "ssmObjectName",
		description = "MOPS base-64 SSM object name, included for convenience. This name can be obtained from `mops_SSM` by joining on `ssmId`",
		type = "VARCHAR(32)",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 156, tableId = 12, name = "q",
		description = "semi-major axis of the orbit (AU)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 157, tableId = 12, name = "e",
		description = "eccentricity e (dimensionless)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 158, tableId = 12, name = "i",
		description = "Inclination of the orbit.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 159, tableId = 12, name = "node",
		description = "Longitude of ascending node.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 160, tableId = 12, name = "meanAnom",
		description = "Mean anomaly of the orbit",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 161, tableId = 12, name = "argPeri",
		description = "Argument of perihelion.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 162, tableId = 12, name = "distPeri",
		description = "perihelion distance (AU)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 163, tableId = 12, name = "timePeri",
		description = "time of perihelion passage, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 164, tableId = 12, name = "epoch",
		description = "epoch of osculating elements, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 165, tableId = 12, name = "h_v",
		description = "Absolute magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 166, tableId = 12, name = "g",
		description = "Slope parameter g",
		type = "DOUBLE",
		notNull = 0,
		defaultValue = "0.15",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 167, tableId = 12, name = "rotationPeriod",
		description = "Rotation period, days",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 168, tableId = 12, name = "rotationEpoch",
		description = "Rotation time origin, MJD (UTC)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 169, tableId = 12, name = "albedo",
		description = "Albedo (dimensionless)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 170, tableId = 12, name = "poleLat",
		description = "Rotation pole latitude (degrees)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 171, tableId = 12, name = "poleLon",
		description = "Rotation pole longitude (degrees)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 172, tableId = 12, name = "d3",
		description = "3-parameter D-criterion (dimensionless) WRT SSM object",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 173, tableId = 12, name = "d4",
		description = "4-parameter D-criterion (dimensionless) WRT SSM object",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 174, tableId = 12, name = "orbFitResidual",
		description = "Orbit fit RMS residual.",
		type = "DOUBLE",
		notNull = 1,
		unit = "argsec",
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 175, tableId = 12, name = "orbFitChi2",
		description = "orbit fit chi-squared statistic",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 176, tableId = 12, name = "classification",
		description = "MOPS efficiency classification ('C'/'M'/'B'/'N'/'X')",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 177, tableId = 12, name = "ssmId",
		description = "Source SSM object for C classification",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 178, tableId = 12, name = "mopsStatus",
		description = "NULL, or set to 'M' when DO is merged with parent",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 179, tableId = 12, name = "stablePass",
		description = "NULL, or set to 'Y' when stable precovery pass completed",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 180, tableId = 12, name = "timeCreated",
		description = "Timestamp for row creation (this is the time of moving object creation for the first version of that object)",
		type = "TIMESTAMP",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 181, tableId = 12, name = "uMag",
		description = "Weighted average apparent magnitude in u filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 182, tableId = 12, name = "uMagErr",
		description = "Uncertainty of uMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 183, tableId = 12, name = "uAmplitude",
		description = "Characteristic magnitude scale of the flux variations for u filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 184, tableId = 12, name = "uPeriod",
		description = "Period of flux variations (if regular) for u filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 185, tableId = 12, name = "gMag",
		description = "Weighted average apparent magnitude in g filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 186, tableId = 12, name = "gMagErr",
		description = "Uncertainty of gMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 187, tableId = 12, name = "gAmplitude",
		description = "Characteristic magnitude scale of the flux variations for g filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 188, tableId = 12, name = "gPeriod",
		description = "Period of flux variations (if regular) for g filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 189, tableId = 12, name = "rMag",
		description = "Weighted average apparent magnitude in r filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 190, tableId = 12, name = "rMagErr",
		description = "Uncertainty of rMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 191, tableId = 12, name = "rAmplitude",
		description = "Characteristic magnitude scale of the flux variations for r filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 192, tableId = 12, name = "rPeriod",
		description = "Period of flux variations (if regular) for r filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 193, tableId = 12, name = "iMag",
		description = "Weighted average apparent magnitude in i filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 194, tableId = 12, name = "iMagErr",
		description = "Uncertainty of iMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 195, tableId = 12, name = "iAmplitude",
		description = "Characteristic magnitude scale of the flux variations for i filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 196, tableId = 12, name = "iPeriod",
		description = "Period of flux variations (if regular) for i filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 197, tableId = 12, name = "zMag",
		description = "Weighted average apparent magnitude in z filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 198, tableId = 12, name = "zMagErr",
		description = "Uncertainty of zMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 199, tableId = 12, name = "zAmplitude",
		description = "Characteristic magnitude scale of the flux variations for z filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 200, tableId = 12, name = "zPeriod",
		description = "Period of flux variations (if regular) for z filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 201, tableId = 12, name = "yMag",
		description = "Weighted average apparent magnitude in y filter.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 202, tableId = 12, name = "yMagErr",
		description = "Uncertainty of yMag.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 203, tableId = 12, name = "yAmplitude",
		description = "Characteristic magnitude scale of the flux variations for y filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 204, tableId = 12, name = "yPeriod",
		description = "Period of flux variations (if regular) for y filter",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 205, tableId = 12, name = "flag",
		description = "Problem/special condition flag.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 206, tableId = 12, name = "src01",
		description = "square root of covariance EC EC (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 207, tableId = 12, name = "src02",
		description = "square root of covariance EC QR (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 208, tableId = 12, name = "src03",
		description = "square root of covariance QR QR (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 209, tableId = 12, name = "src04",
		description = "square root of covariance EC TP (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 210, tableId = 12, name = "src05",
		description = "square root of covariance QR TP (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 211, tableId = 12, name = "src06",
		description = "square root of covariance TP TP (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 212, tableId = 12, name = "src07",
		description = "square root of covariance EC OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 213, tableId = 12, name = "src08",
		description = "square root of covariance QR OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 214, tableId = 12, name = "src09",
		description = "square root of covariance TP OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 215, tableId = 12, name = "src10",
		description = "square root of covariance OM OM (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 216, tableId = 12, name = "src11",
		description = "square root of covariance EC W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 217, tableId = 12, name = "src12",
		description = "square root of covariance QR W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 218, tableId = 12, name = "src13",
		description = "square root of covariance TP W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 219, tableId = 12, name = "src14",
		description = "square root of covariance OM W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 220, tableId = 12, name = "src15",
		description = "square root of covariance W  W  (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 221, tableId = 12, name = "src16",
		description = "square root of covariance EC IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 222, tableId = 12, name = "src17",
		description = "square root of covariance QR IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 223, tableId = 12, name = "src18",
		description = "square root of covariance TP IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 224, tableId = 12, name = "src19",
		description = "square root of covariance OM IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 225, tableId = 12, name = "src20",
		description = "square root of covariance W  IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 226, tableId = 12, name = "src21",
		description = "square root of covariance IN IN (see SQL documentation)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 227, tableId = 12, name = "convCode",
		description = "JPL convergence code",
		type = "VARCHAR(8)",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 228, tableId = 12, name = "o_minus_c",
		description = "Vestigial observed-computed position, essentially RMS residual",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 229, tableId = 12, name = "moid1",
		description = "Minimum orbital intersection distance (MOID) solution 1",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 230, tableId = 12, name = "moidLong1",
		description = "Longitude of MOID 1",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 231, tableId = 12, name = "moid2",
		description = "Minimum orbital intersection distance (MOID) solution 2",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 232, tableId = 12, name = "moidLong2",
		description = "Longitude of MOID 2",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 233, tableId = 12, name = "arcLengthDays",
		description = "Arc length of detections used to compute orbit",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 83;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 13, name = "Object",
	engine = "MyISAM",
	description = "The Object table contains descriptions of the multi-epoch static astronomical objects, in particular their astrophysical properties as derived from analysis of the Sources that are associated with them. Note that fast moving objects are kept in the MovingObject tables. Note that less-frequently used columns are stored in a separate table called ObjectExtras.";

	INSERT INTO md_Column
	SET columnId = 234, tableId = 13, name = "objectId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 235, tableId = 13, name = "iauId",
		description = "IAU compliant name for the object. Example: &quot;LSST-DR11 J001234.65-123456.18 GAL&quot;. The last 3 characters identify classification. Note that it will not accommodate multiple classifications.&#xA;",
		type = "CHAR(34)",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 236, tableId = 13, name = "ra_PS",
		description = "RA-coordinate of the center of the object for the Point Source model for the cannonical filter.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 237, tableId = 13, name = "ra_PS_Sigma",
		description = "Uncertainty of ra_PS.",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 238, tableId = 13, name = "decl_PS",
		description = "Dec-coordinate of the center of the object for the Point Source model for the cannonical filter.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 239, tableId = 13, name = "decl_PS_Sigma",
		description = "Uncertainty of decl_PS.",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 240, tableId = 13, name = "radecl_PS_Cov",
		description = "Covariance of ra_PS and decl_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 241, tableId = 13, name = "ra_SG",
		description = "RA-coordinate of the center of the object for the Small Galaxy model for the cannonical filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 242, tableId = 13, name = "ra_SG_Sigma",
		description = "Uncertainty of ra_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 243, tableId = 13, name = "decl_SG",
		description = "Dec-coordinate of the center of the object for the Small Galaxy model for the cannonical filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 244, tableId = 13, name = "decl_SG_Sigma",
		description = "Uncertainty of decl_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 245, tableId = 13, name = "radecl_SG_Cov",
		description = "Covariance of ra_SG and decl_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 246, tableId = 13, name = "raRange",
		description = "Ra part of the bounding box on the sky that fully encloses footprint of this object for the cannonical model (Small Galaxy) and cannonical filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 247, tableId = 13, name = "declRange",
		description = "Decl part of the bounding box on the sky that fully encloses footprint of this object for the cannonical model (Small Galaxy) and cannonical filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 248, tableId = 13, name = "muRa_PS",
		description = "Proper motion (ra) for the Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/year",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 249, tableId = 13, name = "muRa_PS_Sigma",
		description = "Uncertainty of muRa_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree/year",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 250, tableId = 13, name = "muDecl_PS",
		description = "Proper motion (decl) for the Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/year",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 251, tableId = 13, name = "muDecl_PS_Sigma",
		description = "Uncertainty of muDecl_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree/year",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 252, tableId = 13, name = "muRaDecl_PS_Cov",
		description = "Covariance of muRa_PS and muDecl_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 253, tableId = 13, name = "parallax_PS",
		description = "Parallax for Point Source model.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/year",
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 254, tableId = 13, name = "parallax_PS_Sigma",
		description = "Uncertainty of parallax_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree/year",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 255, tableId = 13, name = "canonicalFilterId",
		description = "Id of the filter which is the canonical filter for size, ellipticity and Sersic index parameters.&#xA;",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 256, tableId = 13, name = "extendedness",
		description = "Probability that this object is an extended object. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 257, tableId = 13, name = "varProb",
		description = "Probability that this object is variable. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 258, tableId = 13, name = "earliestObsTime",
		description = "Time when this object was observed for the first time (taiMidPoint of the first Source)",
		type = "DOUBLE",
		notNull = 0,
		unit = "TAI",
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 259, tableId = 13, name = "latestObsTime",
		description = "The latest time when this object was observed (taiMidPoint of the last Source).",
		type = "DOUBLE",
		notNull = 0,
		unit = "TAI",
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 260, tableId = 13, name = "flags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 261, tableId = 13, name = "uNumObs",
		description = "Number of forced sources associated with this object for u filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 262, tableId = 13, name = "uExtendedness",
		description = "Probability that this object is an extended object for u filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 263, tableId = 13, name = "uVarProb",
		description = "Probability that this object is variable for u filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 264, tableId = 13, name = "uRaOffset_PS",
		description = "Center correction of ra_PS for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 265, tableId = 13, name = "uRaOffset_PS_Sigma",
		description = "Uncertainty of uRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 266, tableId = 13, name = "uDeclOffset_PS",
		description = "Center correction of decl_PS for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 267, tableId = 13, name = "uDeclOffset_PS_Sigma",
		description = "Uncertainty of uDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 268, tableId = 13, name = "uRaDeclOffset_PS_Cov",
		description = "Covariance of uRaOffset_PS and uDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 269, tableId = 13, name = "uRaOffset_SG",
		description = "Center correction of raOffset_SG for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 270, tableId = 13, name = "uRaOffset_SG_Sigma",
		description = "Uncertainty of uRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 271, tableId = 13, name = "uDeclOffset_SG",
		description = "Center correction of decl_SG for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 272, tableId = 13, name = "uDeclOffset_SG_Sigma",
		description = "Uncertainty of uDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 273, tableId = 13, name = "uRaDeclOffset_SG_Cov",
		description = "Covariance of uRaOffset_SG and uDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 274, tableId = 13, name = "uLnL_PS",
		description = "Log-likelihood of being a Point Source for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 275, tableId = 13, name = "uLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 276, tableId = 13, name = "uFlux_PS",
		description = "Flux for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 277, tableId = 13, name = "uFlux_PS_Sigma",
		description = "Uncertainty of uFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 278, tableId = 13, name = "uFlux_SG",
		description = "Flux for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 279, tableId = 13, name = "uFlux_SG_Sigma",
		description = "Uncertainty of uFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 280, tableId = 13, name = "uFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 281, tableId = 13, name = "uFlux_CSG_Sigma",
		description = "Uncertainty of uFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 282, tableId = 13, name = "uTimescale",
		description = "Characteristic timescale of flux variations for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 283, tableId = 13, name = "uEarliestObsTime",
		description = "Time when this object was observed for the first time in u filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 284, tableId = 13, name = "uLatestObsTime",
		description = "The latest time when this object was observed in u filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 285, tableId = 13, name = "uSersicN_SG",
		description = "Sersic index for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 286, tableId = 13, name = "uSersicN_SG_Sigma",
		description = "Uncertainty of uSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 287, tableId = 13, name = "uE1_SG",
		description = "Ellipticity for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 288, tableId = 13, name = "uE1_SG_Sigma",
		description = "Uncertainty of uE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 289, tableId = 13, name = "uE2_SG",
		description = "Ellipticity for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 290, tableId = 13, name = "uE2_SG_Sigma",
		description = "Uncertainty of uE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 291, tableId = 13, name = "uRadius_SG",
		description = "Size of Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 292, tableId = 13, name = "uRadius_SG_Sigma",
		description = "Uncertainty of uRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 293, tableId = 13, name = "uFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 294, tableId = 13, name = "gNumObs",
		description = "Number of forced sources associated with this object for g filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 295, tableId = 13, name = "gExtendedness",
		description = "Probability that this object is an extended object for g filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 296, tableId = 13, name = "gVarProb",
		description = "Probability that this object is variable for g filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 297, tableId = 13, name = "gRaOffset_PS",
		description = "Center correction of ga_PS for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 298, tableId = 13, name = "gRaOffset_PS_Sigma",
		description = "Uncertainty of gRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 299, tableId = 13, name = "gDeclOffset_PS",
		description = "Center correction of decl_PS for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 300, tableId = 13, name = "gDeclOffset_PS_Sigma",
		description = "Uncertainty of gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 301, tableId = 13, name = "gRaDeclOffset_PS_Cov",
		description = "Covariance of gRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 302, tableId = 13, name = "gRaOffset_SG",
		description = "Center correction of gaOffset_SG for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 303, tableId = 13, name = "gRaOffset_SG_Sigma",
		description = "Uncertainty of gRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 304, tableId = 13, name = "gDeclOffset_SG",
		description = "Center correction of decl_SG for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 305, tableId = 13, name = "gDeclOffset_SG_Sigma",
		description = "Uncertainty of gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 306, tableId = 13, name = "gRaDeclOffset_SG_Cov",
		description = "Covariance of gRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 307, tableId = 13, name = "gLnL_PS",
		description = "Log-likelihood of being a Point Source for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 308, tableId = 13, name = "gLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 309, tableId = 13, name = "gFlux_PS",
		description = "Flux for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 310, tableId = 13, name = "gFlux_PS_Sigma",
		description = "Uncertainty of gFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 311, tableId = 13, name = "gFlux_SG",
		description = "Flux for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 312, tableId = 13, name = "gFlux_SG_Sigma",
		description = "Uncertainty of gFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 313, tableId = 13, name = "gFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 314, tableId = 13, name = "gFlux_CSG_Sigma",
		description = "Uncertainty of gFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 315, tableId = 13, name = "gTimescale",
		description = "Characteristic timescale of flux variations for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 316, tableId = 13, name = "gEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 83;

	INSERT INTO md_Column
	SET columnId = 317, tableId = 13, name = "gLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 84;

	INSERT INTO md_Column
	SET columnId = 318, tableId = 13, name = "gSersicN_SG",
		description = "Sersic index for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 85;

	INSERT INTO md_Column
	SET columnId = 319, tableId = 13, name = "gSersicN_SG_Sigma",
		description = "Uncertainty of gSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 86;

	INSERT INTO md_Column
	SET columnId = 320, tableId = 13, name = "gE1_SG",
		description = "Ellipticity for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 87;

	INSERT INTO md_Column
	SET columnId = 321, tableId = 13, name = "gE1_SG_Sigma",
		description = "Uncertainty of gE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 88;

	INSERT INTO md_Column
	SET columnId = 322, tableId = 13, name = "gE2_SG",
		description = "Ellipticity for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 89;

	INSERT INTO md_Column
	SET columnId = 323, tableId = 13, name = "gE2_SG_Sigma",
		description = "Uncertainty of gE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 90;

	INSERT INTO md_Column
	SET columnId = 324, tableId = 13, name = "gRadius_SG",
		description = "Size of Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 91;

	INSERT INTO md_Column
	SET columnId = 325, tableId = 13, name = "gRadius_SG_Sigma",
		description = "Uncertainty of gRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 92;

	INSERT INTO md_Column
	SET columnId = 326, tableId = 13, name = "gFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 93;

	INSERT INTO md_Column
	SET columnId = 327, tableId = 13, name = "rNumObs",
		description = "Number of forced sources associated with this object for r filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 94;

	INSERT INTO md_Column
	SET columnId = 328, tableId = 13, name = "rExtendedness",
		description = "Probability that this object is an extended object for r filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 95;

	INSERT INTO md_Column
	SET columnId = 329, tableId = 13, name = "rVarProb",
		description = "Probability that this object is variable for r filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 96;

	INSERT INTO md_Column
	SET columnId = 330, tableId = 13, name = "rRaOffset_PS",
		description = "Center correction of ra_PS for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 97;

	INSERT INTO md_Column
	SET columnId = 331, tableId = 13, name = "rRaOffset_PS_Sigma",
		description = "Uncertainty of rRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 98;

	INSERT INTO md_Column
	SET columnId = 332, tableId = 13, name = "rDeclOffset_PS",
		description = "Center correction of decl_PS for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 99;

	INSERT INTO md_Column
	SET columnId = 333, tableId = 13, name = "rDeclOffset_PS_Sigma",
		description = "Uncertainty of rDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 100;

	INSERT INTO md_Column
	SET columnId = 334, tableId = 13, name = "rRaDeclOffset_PS_Cov",
		description = "Covariance of rRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 101;

	INSERT INTO md_Column
	SET columnId = 335, tableId = 13, name = "rRaOffset_SG",
		description = "Center correction of raOffset_SG for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 102;

	INSERT INTO md_Column
	SET columnId = 336, tableId = 13, name = "rRaOffset_SG_Sigma",
		description = "Uncertainty of rRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 103;

	INSERT INTO md_Column
	SET columnId = 337, tableId = 13, name = "rDeclOffset_SG",
		description = "Center correction of decl_SG for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 104;

	INSERT INTO md_Column
	SET columnId = 338, tableId = 13, name = "rDeclOffset_SG_Sigma",
		description = "Uncertainty of rDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 105;

	INSERT INTO md_Column
	SET columnId = 339, tableId = 13, name = "rRaDeclOffset_SG_Cov",
		description = "Covariance of rRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 106;

	INSERT INTO md_Column
	SET columnId = 340, tableId = 13, name = "rLnL_PS",
		description = "Log-likelihood of being a Point Source for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 107;

	INSERT INTO md_Column
	SET columnId = 341, tableId = 13, name = "rLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 108;

	INSERT INTO md_Column
	SET columnId = 342, tableId = 13, name = "rFlux_PS",
		description = "Flux for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 109;

	INSERT INTO md_Column
	SET columnId = 343, tableId = 13, name = "rFlux_PS_Sigma",
		description = "Uncertainty of rFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 110;

	INSERT INTO md_Column
	SET columnId = 344, tableId = 13, name = "rFlux_SG",
		description = "Flux for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 111;

	INSERT INTO md_Column
	SET columnId = 345, tableId = 13, name = "rFlux_SG_Sigma",
		description = "Uncertainty of rFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 112;

	INSERT INTO md_Column
	SET columnId = 346, tableId = 13, name = "rFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 113;

	INSERT INTO md_Column
	SET columnId = 347, tableId = 13, name = "rFlux_CSG_Sigma",
		description = "Uncertainty of rFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 114;

	INSERT INTO md_Column
	SET columnId = 348, tableId = 13, name = "rTimescale",
		description = "Characteristic timescale of flux variations for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 115;

	INSERT INTO md_Column
	SET columnId = 349, tableId = 13, name = "rEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 116;

	INSERT INTO md_Column
	SET columnId = 350, tableId = 13, name = "rLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 117;

	INSERT INTO md_Column
	SET columnId = 351, tableId = 13, name = "rSersicN_SG",
		description = "Sersic index for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 118;

	INSERT INTO md_Column
	SET columnId = 352, tableId = 13, name = "rSersicN_SG_Sigma",
		description = "Uncertainty of rSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 119;

	INSERT INTO md_Column
	SET columnId = 353, tableId = 13, name = "rE1_SG",
		description = "Ellipticity for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 120;

	INSERT INTO md_Column
	SET columnId = 354, tableId = 13, name = "rE1_SG_Sigma",
		description = "Uncertainty of rE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 121;

	INSERT INTO md_Column
	SET columnId = 355, tableId = 13, name = "rE2_SG",
		description = "Ellipticity for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 122;

	INSERT INTO md_Column
	SET columnId = 356, tableId = 13, name = "rE2_SG_Sigma",
		description = "Uncertainty of rE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 123;

	INSERT INTO md_Column
	SET columnId = 357, tableId = 13, name = "rRadius_SG",
		description = "Size of Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 124;

	INSERT INTO md_Column
	SET columnId = 358, tableId = 13, name = "rRadius_SG_Sigma",
		description = "Uncertainty of rRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 125;

	INSERT INTO md_Column
	SET columnId = 359, tableId = 13, name = "rFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 126;

	INSERT INTO md_Column
	SET columnId = 360, tableId = 13, name = "iNumObs",
		description = "Number of forced sources associated with this object for i filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 127;

	INSERT INTO md_Column
	SET columnId = 361, tableId = 13, name = "iExtendedness",
		description = "Probability that this object is an extended object for i filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 128;

	INSERT INTO md_Column
	SET columnId = 362, tableId = 13, name = "iVarProb",
		description = "Probability that this object is variable for i filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 129;

	INSERT INTO md_Column
	SET columnId = 363, tableId = 13, name = "iRaOffset_PS",
		description = "Center correction of ia_PS for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 130;

	INSERT INTO md_Column
	SET columnId = 364, tableId = 13, name = "iRaOffset_PS_Sigma",
		description = "Uncertainty of iRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 131;

	INSERT INTO md_Column
	SET columnId = 365, tableId = 13, name = "iDeclOffset_PS",
		description = "Center correction of decl_PS for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 132;

	INSERT INTO md_Column
	SET columnId = 366, tableId = 13, name = "iDeclOffset_PS_Sigma",
		description = "Uncertainty of iDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 133;

	INSERT INTO md_Column
	SET columnId = 367, tableId = 13, name = "iRaDeclOffset_PS_Cov",
		description = "Covariance of iRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 134;

	INSERT INTO md_Column
	SET columnId = 368, tableId = 13, name = "iRaOffset_SG",
		description = "Center correction of iaOffset_SG for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 135;

	INSERT INTO md_Column
	SET columnId = 369, tableId = 13, name = "iRaOffset_SG_Sigma",
		description = "Uncertainty of iRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 136;

	INSERT INTO md_Column
	SET columnId = 370, tableId = 13, name = "iDeclOffset_SG",
		description = "Center correction of decl_SG for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 137;

	INSERT INTO md_Column
	SET columnId = 371, tableId = 13, name = "iDeclOffset_SG_Sigma",
		description = "Uncertainty of iDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 138;

	INSERT INTO md_Column
	SET columnId = 372, tableId = 13, name = "iRaDeclOffset_SG_Cov",
		description = "Covariance of iRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 139;

	INSERT INTO md_Column
	SET columnId = 373, tableId = 13, name = "iLnL_PS",
		description = "Log-likelihood of being a Point Source for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 140;

	INSERT INTO md_Column
	SET columnId = 374, tableId = 13, name = "iLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 141;

	INSERT INTO md_Column
	SET columnId = 375, tableId = 13, name = "iFlux_PS",
		description = "Flux for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 142;

	INSERT INTO md_Column
	SET columnId = 376, tableId = 13, name = "iFlux_PS_Sigma",
		description = "Uncertainty of iFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 143;

	INSERT INTO md_Column
	SET columnId = 377, tableId = 13, name = "iFlux_SG",
		description = "Flux for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 144;

	INSERT INTO md_Column
	SET columnId = 378, tableId = 13, name = "iFlux_SG_Sigma",
		description = "Uncertainty of iFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 145;

	INSERT INTO md_Column
	SET columnId = 379, tableId = 13, name = "iFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 146;

	INSERT INTO md_Column
	SET columnId = 380, tableId = 13, name = "iFlux_CSG_Sigma",
		description = "Uncertainty of iFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 147;

	INSERT INTO md_Column
	SET columnId = 381, tableId = 13, name = "iTimescale",
		description = "Characteristic timescale of flux variations for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 148;

	INSERT INTO md_Column
	SET columnId = 382, tableId = 13, name = "iEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 149;

	INSERT INTO md_Column
	SET columnId = 383, tableId = 13, name = "iLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 150;

	INSERT INTO md_Column
	SET columnId = 384, tableId = 13, name = "iSersicN_SG",
		description = "Sersic index for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 151;

	INSERT INTO md_Column
	SET columnId = 385, tableId = 13, name = "iSersicN_SG_Sigma",
		description = "Uncertainty of iSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 152;

	INSERT INTO md_Column
	SET columnId = 386, tableId = 13, name = "iE1_SG",
		description = "Ellipticity for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 153;

	INSERT INTO md_Column
	SET columnId = 387, tableId = 13, name = "iE1_SG_Sigma",
		description = "Uncertainty of iE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 154;

	INSERT INTO md_Column
	SET columnId = 388, tableId = 13, name = "iE2_SG",
		description = "Ellipticity for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 155;

	INSERT INTO md_Column
	SET columnId = 389, tableId = 13, name = "iE2_SG_Sigma",
		description = "Uncertainty of iE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 156;

	INSERT INTO md_Column
	SET columnId = 390, tableId = 13, name = "iRadius_SG",
		description = "Size of Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 157;

	INSERT INTO md_Column
	SET columnId = 391, tableId = 13, name = "iRadius_SG_Sigma",
		description = "Uncertainty of iRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 158;

	INSERT INTO md_Column
	SET columnId = 392, tableId = 13, name = "iFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 159;

	INSERT INTO md_Column
	SET columnId = 393, tableId = 13, name = "zNumObs",
		description = "Number of forced sources associated with this object for z filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 160;

	INSERT INTO md_Column
	SET columnId = 394, tableId = 13, name = "zExtendedness",
		description = "Probability that this object is an extended object for z filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 161;

	INSERT INTO md_Column
	SET columnId = 395, tableId = 13, name = "zVarProb",
		description = "Probability that this object is variable for z filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 162;

	INSERT INTO md_Column
	SET columnId = 396, tableId = 13, name = "zRaOffset_PS",
		description = "Center correction of za_PS for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 163;

	INSERT INTO md_Column
	SET columnId = 397, tableId = 13, name = "zRaOffset_PS_Sigma",
		description = "Uncertainty of zRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 164;

	INSERT INTO md_Column
	SET columnId = 398, tableId = 13, name = "zDeclOffset_PS",
		description = "Center correction of decl_PS for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 165;

	INSERT INTO md_Column
	SET columnId = 399, tableId = 13, name = "zDeclOffset_PS_Sigma",
		description = "Uncertainty of zDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 166;

	INSERT INTO md_Column
	SET columnId = 400, tableId = 13, name = "zRaDeclOffset_PS_Cov",
		description = "Covariance of zRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 167;

	INSERT INTO md_Column
	SET columnId = 401, tableId = 13, name = "zRaOffset_SG",
		description = "Center correction of zaOffset_SG for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 168;

	INSERT INTO md_Column
	SET columnId = 402, tableId = 13, name = "zRaOffset_SG_Sigma",
		description = "Uncertainty of zRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 169;

	INSERT INTO md_Column
	SET columnId = 403, tableId = 13, name = "zDeclOffset_SG",
		description = "Center correction of decl_SG for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 170;

	INSERT INTO md_Column
	SET columnId = 404, tableId = 13, name = "zDeclOffset_SG_Sigma",
		description = "Uncertainty of zDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 171;

	INSERT INTO md_Column
	SET columnId = 405, tableId = 13, name = "zRaDeclOffset_SG_Cov",
		description = "Covariance of zRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 172;

	INSERT INTO md_Column
	SET columnId = 406, tableId = 13, name = "zLnL_PS",
		description = "Log-likelihood of being a Point Source for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 173;

	INSERT INTO md_Column
	SET columnId = 407, tableId = 13, name = "zLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 174;

	INSERT INTO md_Column
	SET columnId = 408, tableId = 13, name = "zFlux_PS",
		description = "Flux for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 175;

	INSERT INTO md_Column
	SET columnId = 409, tableId = 13, name = "zFlux_PS_Sigma",
		description = "Uncertainty of zFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 176;

	INSERT INTO md_Column
	SET columnId = 410, tableId = 13, name = "zFlux_SG",
		description = "Flux for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 177;

	INSERT INTO md_Column
	SET columnId = 411, tableId = 13, name = "zFlux_SG_Sigma",
		description = "Uncertainty of zFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 178;

	INSERT INTO md_Column
	SET columnId = 412, tableId = 13, name = "zFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 179;

	INSERT INTO md_Column
	SET columnId = 413, tableId = 13, name = "zFlux_CSG_Sigma",
		description = "Uncertainty of zFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 180;

	INSERT INTO md_Column
	SET columnId = 414, tableId = 13, name = "zTimescale",
		description = "Characteristic timescale of flux variations for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 181;

	INSERT INTO md_Column
	SET columnId = 415, tableId = 13, name = "zEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 182;

	INSERT INTO md_Column
	SET columnId = 416, tableId = 13, name = "zLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 183;

	INSERT INTO md_Column
	SET columnId = 417, tableId = 13, name = "zSersicN_SG",
		description = "Sersic index for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 184;

	INSERT INTO md_Column
	SET columnId = 418, tableId = 13, name = "zSersicN_SG_Sigma",
		description = "Uncertainty of zSersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 185;

	INSERT INTO md_Column
	SET columnId = 419, tableId = 13, name = "zE1_SG",
		description = "Ellipticity for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 186;

	INSERT INTO md_Column
	SET columnId = 420, tableId = 13, name = "zE1_SG_Sigma",
		description = "Uncertainty of zE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 187;

	INSERT INTO md_Column
	SET columnId = 421, tableId = 13, name = "zE2_SG",
		description = "Ellipticity for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 188;

	INSERT INTO md_Column
	SET columnId = 422, tableId = 13, name = "zE2_SG_Sigma",
		description = "Uncertainty of zE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 189;

	INSERT INTO md_Column
	SET columnId = 423, tableId = 13, name = "zRadius_SG",
		description = "Size of Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 190;

	INSERT INTO md_Column
	SET columnId = 424, tableId = 13, name = "zRadius_SG_Sigma",
		description = "Uncertainty of zRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 191;

	INSERT INTO md_Column
	SET columnId = 425, tableId = 13, name = "zFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 192;

	INSERT INTO md_Column
	SET columnId = 426, tableId = 13, name = "yNumObs",
		description = "Number of forced sources associated with this object for y filter.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 193;

	INSERT INTO md_Column
	SET columnId = 427, tableId = 13, name = "yExtendedness",
		description = "Probability that this object is an extended object for y filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 194;

	INSERT INTO md_Column
	SET columnId = 428, tableId = 13, name = "yVarProb",
		description = "Probability that this object is variable for y filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 195;

	INSERT INTO md_Column
	SET columnId = 429, tableId = 13, name = "yRaOffset_PS",
		description = "Center correction of ya_PS for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 196;

	INSERT INTO md_Column
	SET columnId = 430, tableId = 13, name = "yRaOffset_PS_Sigma",
		description = "Uncertainty of yRaOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 197;

	INSERT INTO md_Column
	SET columnId = 431, tableId = 13, name = "yDeclOffset_PS",
		description = "Center correction of decl_PS for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 198;

	INSERT INTO md_Column
	SET columnId = 432, tableId = 13, name = "yDeclOffset_PS_Sigma",
		description = "Uncertainty of yDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 199;

	INSERT INTO md_Column
	SET columnId = 433, tableId = 13, name = "yRaDeclOffset_PS_Cov",
		description = "Covariance of yRaOffset_PS and gDeclOffset_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 200;

	INSERT INTO md_Column
	SET columnId = 434, tableId = 13, name = "yRaOffset_SG",
		description = "Center correction of yaOffset_SG for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 201;

	INSERT INTO md_Column
	SET columnId = 435, tableId = 13, name = "yRaOffset_SG_Sigma",
		description = "Uncertainty of yRaOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 202;

	INSERT INTO md_Column
	SET columnId = 436, tableId = 13, name = "yDeclOffset_SG",
		description = "Center correction of decl_SG for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 203;

	INSERT INTO md_Column
	SET columnId = 437, tableId = 13, name = "yDeclOffset_SG_Sigma",
		description = "Uncertainty of yDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 204;

	INSERT INTO md_Column
	SET columnId = 438, tableId = 13, name = "yRaDeclOffset_SG_Cov",
		description = "Covariance of yRaOffset_SG and gDeclOffset_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 205;

	INSERT INTO md_Column
	SET columnId = 439, tableId = 13, name = "yLnL_PS",
		description = "Log-likelihood of being a Point Source for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 206;

	INSERT INTO md_Column
	SET columnId = 440, tableId = 13, name = "yLnL_SG",
		description = "Log-likelihood of being a Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 207;

	INSERT INTO md_Column
	SET columnId = 441, tableId = 13, name = "yFlux_PS",
		description = "Flux for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 208;

	INSERT INTO md_Column
	SET columnId = 442, tableId = 13, name = "yFlux_PS_Sigma",
		description = "Uncertainty of yFlux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 209;

	INSERT INTO md_Column
	SET columnId = 443, tableId = 13, name = "yFlux_SG",
		description = "Flux for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 210;

	INSERT INTO md_Column
	SET columnId = 444, tableId = 13, name = "yFlux_SG_Sigma",
		description = "Uncertainty of yFlux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 211;

	INSERT INTO md_Column
	SET columnId = 445, tableId = 13, name = "yFlux_CSG",
		description = "Flux for Cannonical Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 212;

	INSERT INTO md_Column
	SET columnId = 446, tableId = 13, name = "yFlux_CSG_Sigma",
		description = "Uncertainty of yFlux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 213;

	INSERT INTO md_Column
	SET columnId = 447, tableId = 13, name = "yTimescale",
		description = "Characteristic timescale of flux variations for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 214;

	INSERT INTO md_Column
	SET columnId = 448, tableId = 13, name = "yEarliestObsTime",
		description = "Time when this object was observed for the first time in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 215;

	INSERT INTO md_Column
	SET columnId = 449, tableId = 13, name = "yLatestObsTime",
		description = "The latest time when this object was observed in g filter.&#xA;",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 216;

	INSERT INTO md_Column
	SET columnId = 450, tableId = 13, name = "ySersicN_SG",
		description = "Sersic index for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 217;

	INSERT INTO md_Column
	SET columnId = 451, tableId = 13, name = "ySersicN_SG_Sigma",
		description = "Uncertainty of ySersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 218;

	INSERT INTO md_Column
	SET columnId = 452, tableId = 13, name = "yE1_SG",
		description = "Ellipticity for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 219;

	INSERT INTO md_Column
	SET columnId = 453, tableId = 13, name = "yE1_SG_Sigma",
		description = "Uncertainty of yE1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 220;

	INSERT INTO md_Column
	SET columnId = 454, tableId = 13, name = "yE2_SG",
		description = "Ellipticity for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 221;

	INSERT INTO md_Column
	SET columnId = 455, tableId = 13, name = "yE2_SG_Sigma",
		description = "Uncertainty of yE2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 222;

	INSERT INTO md_Column
	SET columnId = 456, tableId = 13, name = "yRadius_SG",
		description = "Size of Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 223;

	INSERT INTO md_Column
	SET columnId = 457, tableId = 13, name = "yRadius_SG_Sigma",
		description = "Uncertainty of yRadius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 224;

	INSERT INTO md_Column
	SET columnId = 458, tableId = 13, name = "yFlags",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 225;

	INSERT INTO md_Column
	SET columnId = 459, tableId = 13, name = "_chunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 226;

	INSERT INTO md_Column
	SET columnId = 460, tableId = 13, name = "_subChunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 227;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 14, name = "ObjectExtras",
	engine = "MyISAM",
	description = "This table contains less-frequently used columns from the Object table.&#xA;";

	INSERT INTO md_Column
	SET columnId = 461, tableId = 14, name = "objectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 462, tableId = 14, name = "uFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 463, tableId = 14, name = "uFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 464, tableId = 14, name = "uRa_decl_PS_Cov",
		description = "Covariance of ra and decl for Point Source model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 465, tableId = 14, name = "uFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 466, tableId = 14, name = "uFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 467, tableId = 14, name = "uFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 468, tableId = 14, name = "uFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 469, tableId = 14, name = "uFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 470, tableId = 14, name = "uFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 471, tableId = 14, name = "uRa_decl_SG_Cov",
		description = "Covariance of ra and decl for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 472, tableId = 14, name = "uRa_SersicN_SG_Cov",
		description = "Covariance of ra and SersicN for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 473, tableId = 14, name = "uRa_e1_SG_Cov",
		description = "Covariance of ra and e1 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 474, tableId = 14, name = "uRa_e2_SG_Cov",
		description = "Covariance of ra and e2 for Small Galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 475, tableId = 14, name = "uRa_radius_SG_Cov",
		description = "Covariance of ra and radius for small galaxy model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 476, tableId = 14, name = "uDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 477, tableId = 14, name = "uDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 478, tableId = 14, name = "uDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 479, tableId = 14, name = "uDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 480, tableId = 14, name = "uSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 481, tableId = 14, name = "uSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 482, tableId = 14, name = "uSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 483, tableId = 14, name = "uE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 484, tableId = 14, name = "uE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 485, tableId = 14, name = "uE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for u filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 486, tableId = 14, name = "gFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 487, tableId = 14, name = "gFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 488, tableId = 14, name = "gRa_decl_PS_Cov",
		description = "Covariance of ga and decl for Point Source model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 489, tableId = 14, name = "gFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 490, tableId = 14, name = "gFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 491, tableId = 14, name = "gFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 492, tableId = 14, name = "gFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 493, tableId = 14, name = "gFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 494, tableId = 14, name = "gFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 495, tableId = 14, name = "gRa_decl_SG_Cov",
		description = "Covariance of ga and decl for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 496, tableId = 14, name = "gRa_SersicN_SG_Cov",
		description = "Covariance of ga and SersicN for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 497, tableId = 14, name = "gRa_e1_SG_Cov",
		description = "Covariance of ga and e1 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 498, tableId = 14, name = "gRa_e2_SG_Cov",
		description = "Covariance of ga and e2 for Small Galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 499, tableId = 14, name = "gRa_radius_SG_Cov",
		description = "Covariance of ga and radius for small galaxy model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 500, tableId = 14, name = "gDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 501, tableId = 14, name = "gDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 502, tableId = 14, name = "gDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 503, tableId = 14, name = "gDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 504, tableId = 14, name = "gSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 505, tableId = 14, name = "gSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 506, tableId = 14, name = "gSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 507, tableId = 14, name = "gE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 508, tableId = 14, name = "gE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 509, tableId = 14, name = "gE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for g filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 510, tableId = 14, name = "rFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 511, tableId = 14, name = "rFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 512, tableId = 14, name = "rRa_decl_PS_Cov",
		description = "Covariance of ra and decl for Point Source model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 513, tableId = 14, name = "rFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 514, tableId = 14, name = "rFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 515, tableId = 14, name = "rFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 516, tableId = 14, name = "rFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 517, tableId = 14, name = "rFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 518, tableId = 14, name = "rFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 519, tableId = 14, name = "rRa_decl_SG_Cov",
		description = "Covariance of ra and decl for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 520, tableId = 14, name = "rRa_SersicN_SG_Cov",
		description = "Covariance of ra and SersicN for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 521, tableId = 14, name = "rRa_e1_SG_Cov",
		description = "Covariance of ra and e1 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 522, tableId = 14, name = "rRa_e2_SG_Cov",
		description = "Covariance of ra and e2 for Small Galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 523, tableId = 14, name = "rRa_radius_SG_Cov",
		description = "Covariance of ra and radius for small galaxy model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 524, tableId = 14, name = "rDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 525, tableId = 14, name = "rDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 526, tableId = 14, name = "rDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 527, tableId = 14, name = "rDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 528, tableId = 14, name = "rSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 529, tableId = 14, name = "rSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 530, tableId = 14, name = "rSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 531, tableId = 14, name = "rE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 532, tableId = 14, name = "rE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 533, tableId = 14, name = "rE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for r filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 534, tableId = 14, name = "iFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 535, tableId = 14, name = "iFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 536, tableId = 14, name = "iRa_decl_PS_Cov",
		description = "Covariance of ia and decl for Point Source model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 537, tableId = 14, name = "iFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 538, tableId = 14, name = "iFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 539, tableId = 14, name = "iFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 540, tableId = 14, name = "iFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 541, tableId = 14, name = "iFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 542, tableId = 14, name = "iFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 543, tableId = 14, name = "iRa_decl_SG_Cov",
		description = "Covariance of ia and decl for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 83;

	INSERT INTO md_Column
	SET columnId = 544, tableId = 14, name = "iRa_SersicN_SG_Cov",
		description = "Covariance of ia and SersicN for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 84;

	INSERT INTO md_Column
	SET columnId = 545, tableId = 14, name = "iRa_e1_SG_Cov",
		description = "Covariance of ia and e1 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 85;

	INSERT INTO md_Column
	SET columnId = 546, tableId = 14, name = "iRa_e2_SG_Cov",
		description = "Covariance of ia and e2 for Small Galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 86;

	INSERT INTO md_Column
	SET columnId = 547, tableId = 14, name = "iRa_radius_SG_Cov",
		description = "Covariance of ia and radius for small galaxy model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 87;

	INSERT INTO md_Column
	SET columnId = 548, tableId = 14, name = "iDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 88;

	INSERT INTO md_Column
	SET columnId = 549, tableId = 14, name = "iDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 89;

	INSERT INTO md_Column
	SET columnId = 550, tableId = 14, name = "iDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 90;

	INSERT INTO md_Column
	SET columnId = 551, tableId = 14, name = "iDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 91;

	INSERT INTO md_Column
	SET columnId = 552, tableId = 14, name = "iSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 92;

	INSERT INTO md_Column
	SET columnId = 553, tableId = 14, name = "iSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 93;

	INSERT INTO md_Column
	SET columnId = 554, tableId = 14, name = "iSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 94;

	INSERT INTO md_Column
	SET columnId = 555, tableId = 14, name = "iE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 95;

	INSERT INTO md_Column
	SET columnId = 556, tableId = 14, name = "iE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 96;

	INSERT INTO md_Column
	SET columnId = 557, tableId = 14, name = "iE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for i filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 97;

	INSERT INTO md_Column
	SET columnId = 558, tableId = 14, name = "zFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 98;

	INSERT INTO md_Column
	SET columnId = 559, tableId = 14, name = "zFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 99;

	INSERT INTO md_Column
	SET columnId = 560, tableId = 14, name = "zRa_decl_PS_Cov",
		description = "Covariance of za and decl for Point Source model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 100;

	INSERT INTO md_Column
	SET columnId = 561, tableId = 14, name = "zFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 101;

	INSERT INTO md_Column
	SET columnId = 562, tableId = 14, name = "zFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 102;

	INSERT INTO md_Column
	SET columnId = 563, tableId = 14, name = "zFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 103;

	INSERT INTO md_Column
	SET columnId = 564, tableId = 14, name = "zFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 104;

	INSERT INTO md_Column
	SET columnId = 565, tableId = 14, name = "zFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 105;

	INSERT INTO md_Column
	SET columnId = 566, tableId = 14, name = "zFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 106;

	INSERT INTO md_Column
	SET columnId = 567, tableId = 14, name = "zRa_decl_SG_Cov",
		description = "Covariance of za and decl for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 107;

	INSERT INTO md_Column
	SET columnId = 568, tableId = 14, name = "zRa_SersicN_SG_Cov",
		description = "Covariance of za and SersicN for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 108;

	INSERT INTO md_Column
	SET columnId = 569, tableId = 14, name = "zRa_e1_SG_Cov",
		description = "Covariance of za and e1 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 109;

	INSERT INTO md_Column
	SET columnId = 570, tableId = 14, name = "zRa_e2_SG_Cov",
		description = "Covariance of za and e2 for Small Galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 110;

	INSERT INTO md_Column
	SET columnId = 571, tableId = 14, name = "zRa_radius_SG_Cov",
		description = "Covariance of za and radius for small galaxy model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 111;

	INSERT INTO md_Column
	SET columnId = 572, tableId = 14, name = "zDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 112;

	INSERT INTO md_Column
	SET columnId = 573, tableId = 14, name = "zDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 113;

	INSERT INTO md_Column
	SET columnId = 574, tableId = 14, name = "zDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 114;

	INSERT INTO md_Column
	SET columnId = 575, tableId = 14, name = "zDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 115;

	INSERT INTO md_Column
	SET columnId = 576, tableId = 14, name = "zSersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 116;

	INSERT INTO md_Column
	SET columnId = 577, tableId = 14, name = "zSersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 117;

	INSERT INTO md_Column
	SET columnId = 578, tableId = 14, name = "zSersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 118;

	INSERT INTO md_Column
	SET columnId = 579, tableId = 14, name = "zE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 119;

	INSERT INTO md_Column
	SET columnId = 580, tableId = 14, name = "zE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 120;

	INSERT INTO md_Column
	SET columnId = 581, tableId = 14, name = "zE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for z filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 121;

	INSERT INTO md_Column
	SET columnId = 582, tableId = 14, name = "yFlux_ra_PS_Cov",
		description = "Covariance of flux and ra for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 122;

	INSERT INTO md_Column
	SET columnId = 583, tableId = 14, name = "yFlux_decl_PS_Cov",
		description = "Covariance of flux and decl for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 123;

	INSERT INTO md_Column
	SET columnId = 584, tableId = 14, name = "yRa_decl_PS_Cov",
		description = "Covariance of ya and decl for Point Source model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 124;

	INSERT INTO md_Column
	SET columnId = 585, tableId = 14, name = "yFlux_ra_SG_Cov",
		description = "Covariance of flux and ra for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 125;

	INSERT INTO md_Column
	SET columnId = 586, tableId = 14, name = "yFlux_decl_SG_Cov",
		description = "Covariance of flux and decl for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 126;

	INSERT INTO md_Column
	SET columnId = 587, tableId = 14, name = "yFlux_SersicN_SG_Cov",
		description = "Covariance of flux and SersicN for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 127;

	INSERT INTO md_Column
	SET columnId = 588, tableId = 14, name = "yFlux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 128;

	INSERT INTO md_Column
	SET columnId = 589, tableId = 14, name = "yFlux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 129;

	INSERT INTO md_Column
	SET columnId = 590, tableId = 14, name = "yFlux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 130;

	INSERT INTO md_Column
	SET columnId = 591, tableId = 14, name = "yRa_decl_SG_Cov",
		description = "Covariance of ya and decl for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 131;

	INSERT INTO md_Column
	SET columnId = 592, tableId = 14, name = "yRa_SersicN_SG_Cov",
		description = "Covariance of ya and SersicN for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 132;

	INSERT INTO md_Column
	SET columnId = 593, tableId = 14, name = "yRa_e1_SG_Cov",
		description = "Covariance of ya and e1 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 133;

	INSERT INTO md_Column
	SET columnId = 594, tableId = 14, name = "yRa_e2_SG_Cov",
		description = "Covariance of ya and e2 for Small Galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 134;

	INSERT INTO md_Column
	SET columnId = 595, tableId = 14, name = "yRa_radius_SG_Cov",
		description = "Covariance of ya and radius for small galaxy model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 135;

	INSERT INTO md_Column
	SET columnId = 596, tableId = 14, name = "yDecl_SersicN_SG_Cov",
		description = "Covariance of decl and SersicN for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 136;

	INSERT INTO md_Column
	SET columnId = 597, tableId = 14, name = "yDecl_e1_SG_Cov",
		description = "Covariance of decl and e1 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 137;

	INSERT INTO md_Column
	SET columnId = 598, tableId = 14, name = "yDecl_e2_SG_Cov",
		description = "Covariance of decl and e2 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 138;

	INSERT INTO md_Column
	SET columnId = 599, tableId = 14, name = "yDecl_radius_SG_Cov",
		description = "Covariance of decl and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 139;

	INSERT INTO md_Column
	SET columnId = 600, tableId = 14, name = "ySersicN_e1_SG_Cov",
		description = "Covariance of SersicN and e1 for Small Galaxy Model for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 140;

	INSERT INTO md_Column
	SET columnId = 601, tableId = 14, name = "ySersicN_e2_SG_Cov",
		description = "Covariance of SersicN and e2 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 141;

	INSERT INTO md_Column
	SET columnId = 602, tableId = 14, name = "ySersicN_radius_SG_Cov",
		description = "Covariance of SersicN and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 142;

	INSERT INTO md_Column
	SET columnId = 603, tableId = 14, name = "yE1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 143;

	INSERT INTO md_Column
	SET columnId = 604, tableId = 14, name = "yE1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 144;

	INSERT INTO md_Column
	SET columnId = 605, tableId = 14, name = "yE2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy for y filter.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 145;

	INSERT INTO md_Column
	SET columnId = 606, tableId = 14, name = "_chunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 146;

	INSERT INTO md_Column
	SET columnId = 607, tableId = 14, name = "_subChunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 147;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 15, name = "ObjectType",
	engine = "MyISAM",
	description = "Table to store description of object types. It includes all object types: static, variables, Solar System objects, etc.";

	INSERT INTO md_Column
	SET columnId = 608, tableId = 15, name = "typeId",
		description = "Unique id.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 609, tableId = 15, name = "description",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 16, name = "RaftMap",
	description = "Mapping table to translate raft names to numbers.";

	INSERT INTO md_Column
	SET columnId = 610, tableId = 16, name = "raftNum",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 611, tableId = 16, name = "raftName",
		type = "CHAR(3)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 17, name = "RaftMetadata",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 612, tableId = 17, name = "raftId",
		description = "tbd&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 613, tableId = 17, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 614, tableId = 17, name = "metadataValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 18, name = "Raw_Amp_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 615, tableId = 18, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 616, tableId = 18, name = "visit",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 617, tableId = 18, name = "snap",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 618, tableId = 18, name = "raft",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 619, tableId = 18, name = "ccd",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 620, tableId = 18, name = "amp",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 621, tableId = 18, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 622, tableId = 18, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 623, tableId = 18, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 624, tableId = 18, name = "equinox",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 625, tableId = 18, name = "raDeSys",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 626, tableId = 18, name = "ctype1",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 627, tableId = 18, name = "ctype2",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 628, tableId = 18, name = "crpix1",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 629, tableId = 18, name = "crpix2",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 630, tableId = 18, name = "crval1",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 631, tableId = 18, name = "crval2",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 632, tableId = 18, name = "cd1_1",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 633, tableId = 18, name = "cd1_2",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 634, tableId = 18, name = "cd2_1",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 635, tableId = 18, name = "cd2_2",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 636, tableId = 18, name = "llcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 637, tableId = 18, name = "llcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 638, tableId = 18, name = "ulcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 639, tableId = 18, name = "ulcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 640, tableId = 18, name = "urcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 641, tableId = 18, name = "urcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 642, tableId = 18, name = "lrcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 643, tableId = 18, name = "lrcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 644, tableId = 18, name = "taiMjd",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 645, tableId = 18, name = "obsStart",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 646, tableId = 18, name = "expMidpt",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 647, tableId = 18, name = "expTime",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 648, tableId = 18, name = "airmass",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 649, tableId = 18, name = "darkTime",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 650, tableId = 18, name = "zd",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 19, name = "Raw_Amp_Exposure_Metadata",
	engine = "MyISAM",
	description = "Generic key-value pair metadata for Raw_Amp_Exposure.";

	INSERT INTO md_Column
	SET columnId = 651, tableId = 19, name = "rawAmpExposureId",
		description = "Id of the corresponding Raw_Amp_Exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 652, tableId = 19, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 653, tableId = 19, name = "exposureType",
		description = "Meaning of the bits: 0x1 - rawAmp, 0x2 - postIsrAmp, more tbd.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 654, tableId = 19, name = "intValue",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 655, tableId = 19, name = "doubleValue",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 656, tableId = 19, name = "stringValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 20, name = "Raw_Amp_To_Science_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 657, tableId = 20, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 658, tableId = 20, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 659, tableId = 20, name = "snap",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 660, tableId = 20, name = "amp",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 21, name = "Raw_Amp_To_Snap_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 661, tableId = 21, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 662, tableId = 21, name = "amp",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 663, tableId = 21, name = "snapCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 22, name = "Raw_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 664, tableId = 22, name = "rawCcdExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 665, tableId = 22, name = "ra",
		description = "Right Ascension of aperture center.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 666, tableId = 22, name = "decl",
		description = "Declination of aperture center.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 667, tableId = 22, name = "filterId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 668, tableId = 22, name = "equinox",
		description = "Equinox of World Coordinate System.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 669, tableId = 22, name = "radecSys",
		description = "Coordinate system type. (Allowed systems: FK5, ICRS)",
		type = "VARCHAR(20)",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 670, tableId = 22, name = "dateObs",
		description = "Date/Time of observation start (UTC).",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "0",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 671, tableId = 22, name = "url",
		description = "Logical URL to the actual raw image.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 672, tableId = 22, name = "ctype1",
		description = "Coordinate projection type, axis 1.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 673, tableId = 22, name = "ctype2",
		description = "Coordinate projection type, axis 2.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 674, tableId = 22, name = "mjdObs",
		description = "MJD of observation start.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 675, tableId = 22, name = "airmass",
		description = "Airmass value for the Amp reference pixel (preferably center, but not guaranteed). Range: [-99.999, 99.999] is enough to accomodate ZD in [0, 89.433].",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 676, tableId = 22, name = "crpix1",
		description = "Coordinate reference pixel, axis 1.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 677, tableId = 22, name = "crpix2",
		description = "Coordinate reference pixel, axis 2.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 678, tableId = 22, name = "crval1",
		description = "Coordinate value 1 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 679, tableId = 22, name = "crval2",
		description = "Coordinate value 2 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 680, tableId = 22, name = "cd11",
		description = "First derivative of coordinate 1 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 681, tableId = 22, name = "cd21",
		description = "First derivative of coordinate 2 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 682, tableId = 22, name = "darkTime",
		description = "Total elapsed time from exposure start to end of read.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 683, tableId = 22, name = "cd12",
		description = "First derivative of coordinate 1 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 684, tableId = 22, name = "zd",
		description = "Zenith distance at observation mid-point.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 685, tableId = 22, name = "cd22",
		description = "First derivative of coordinate 2 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 686, tableId = 22, name = "taiObs",
		description = "TAI-OBS = UTC + offset, offset = 32 s from  1/1/1999 to 1/1/2006",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "0",
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 687, tableId = 22, name = "expTime",
		description = "Duration of exposure.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 24;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 23, name = "Raw_Ccd_Exposure_Metadata",
	engine = "MyISAM",
	description = "Generic key-value pair metadata for Raw_Ccd_Exposure.&#xA;";

	INSERT INTO md_Column
	SET columnId = 688, tableId = 23, name = "rawCcdExposureId",
		description = "Id of the corresponding Raw_Ccd_Exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 689, tableId = 23, name = "exposureType",
		description = "Meaning of the bits: 0x1 - rawCcd, 0x2 - postIsrCcd, more tbd.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 690, tableId = 23, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 691, tableId = 23, name = "metadataValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 24, name = "RefObjMatch",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 692, tableId = 24, name = "refObjectId",
		description = "Reference object id (pointer to SimRefObject). NULL if object has no matches.",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 693, tableId = 24, name = "objectId",
		description = "Object id. NULL if object has no matches.",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 694, tableId = 24, name = "refRa",
		description = "ICRS reference object RA at mean epoch of object.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 695, tableId = 24, name = "refDec",
		description = "ICRS reference object Dec at mean epoch of object.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 696, tableId = 24, name = "angSep",
		description = "Angular separation between reference object and  object.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 697, tableId = 24, name = "nRefMatches",
		description = "Total number of matches for reference object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 698, tableId = 24, name = "nObjMatches",
		description = "Total number of matches for object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 699, tableId = 24, name = "closestToRef",
		description = "Is object the closest match for reference object?",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 700, tableId = 24, name = "closestToObj",
		description = "Is reference object the closest match for object?",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 701, tableId = 24, name = "flags",
		description = "Bitwise or of match flags:&#xA;&lt;ul&gt;&#xA;	&lt;li&gt;0x1: the reference object has proper motion&lt;/li&gt;&#xA;	&lt;li&gt;0x2: the reference object has parallax&lt;/li&gt;&#xA;	&lt;li&gt;0x4: a reduction for parallax from barycentric to geocentric place was applied prior to matching the reference object. Should never be set when matching against objects, but may be set when matching against sources.&lt;/li&gt;&#xA;&lt;/ul&gt;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 25, name = "Science_Amp_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 702, tableId = 25, name = "scienceAmpExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 703, tableId = 25, name = "scienceCcdExposureId",
		description = "Pointer to Science_Ccd_Exposure containing this science amp exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 704, tableId = 25, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 705, tableId = 25, name = "ampId",
		description = "Pointer to the amplifier corresponding to this amp exposure.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 26, name = "Science_Amp_Exposure_Metadata",
	engine = "MyISAM",
	description = "Generic key-value pair metadata for Science_Amp_Exposure.";

	INSERT INTO md_Column
	SET columnId = 706, tableId = 26, name = "scienceAmpExposureId",
		description = "Id of the corresponding Science_Amp_Exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 707, tableId = 26, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 708, tableId = 26, name = "exposureType",
		description = "Meaning of the bits: 0x1 - scienceAmp, 0x2 - diffAmp, more tbd.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 709, tableId = 26, name = "intValue",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 710, tableId = 26, name = "doubleValue",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 711, tableId = 26, name = "stringValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 27, name = "Science_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 712, tableId = 27, name = "scienceCcdExposureId",
		description = "Primary key (unique identifier).&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 713, tableId = 27, name = "visit",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 714, tableId = 27, name = "raft",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 715, tableId = 27, name = "ccd",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 716, tableId = 27, name = "filterId",
		description = "Pointer to filter.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 717, tableId = 27, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 718, tableId = 27, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 719, tableId = 27, name = "equinox",
		description = "Equinox of World Coordinate System.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 720, tableId = 27, name = "raDeSys",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 721, tableId = 27, name = "ctype1",
		description = "Coordinate projection type, axis 1.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 722, tableId = 27, name = "ctype2",
		description = "Coordinate projection type, axis 2.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 723, tableId = 27, name = "crpix1",
		description = "Coordinate reference pixel, axis 1.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 724, tableId = 27, name = "crpix2",
		description = "Coordinate reference pixel, axis 2.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 725, tableId = 27, name = "crval1",
		description = "Coordinate value 1 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 726, tableId = 27, name = "crval2",
		description = "Coordinate value 2 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 727, tableId = 27, name = "cd1_1",
		description = "First derivative of coordinate 1 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 728, tableId = 27, name = "cd1_2",
		description = "First derivative of coordinate 1 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 729, tableId = 27, name = "cd2_1",
		description = "First derivative of coordinate 2 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 730, tableId = 27, name = "cd2_2",
		description = "First derivative of coordinate 2 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 731, tableId = 27, name = "llcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 732, tableId = 27, name = "llcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 733, tableId = 27, name = "ulcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 734, tableId = 27, name = "ulcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 735, tableId = 27, name = "urcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 736, tableId = 27, name = "urcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 737, tableId = 27, name = "lrcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 738, tableId = 27, name = "lrcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 739, tableId = 27, name = "taiMjd",
		description = "Date of the start of the exposure",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 740, tableId = 27, name = "obsStart",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 741, tableId = 27, name = "expMidpt",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 742, tableId = 27, name = "expTime",
		description = "Duration of exposure.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 743, tableId = 27, name = "nCombine",
		description = "Number of images co-added to create a deeper image",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 744, tableId = 27, name = "binX",
		description = "Binning of the ccd in x.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 745, tableId = 27, name = "binY",
		description = "Binning of the ccd in y.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 746, tableId = 27, name = "readNoise",
		description = "Read noise of the ccd.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 747, tableId = 27, name = "saturationLimit",
		description = "Saturation limit for the ccd (average of the amplifiers).",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 748, tableId = 27, name = "gainEff",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 749, tableId = 27, name = "fluxMag0",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 750, tableId = 27, name = "fluxMag0Sigma",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 751, tableId = 27, name = "fwhm",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 40;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 28, name = "Science_Ccd_Exposure_Metadata",
	engine = "MyISAM",
	description = "Generic key-value pair metadata for Science_Ccd_Exposure.";

	INSERT INTO md_Column
	SET columnId = 752, tableId = 28, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 753, tableId = 28, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 754, tableId = 28, name = "exposureType",
		description = "Meaning of the bits: 0x1 - scienceCcd, 0x2 - diffCcd, more tbd.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 755, tableId = 28, name = "intValue",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 756, tableId = 28, name = "doubleValue",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 757, tableId = 28, name = "stringValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 29, name = "SimRefObject",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 758, tableId = 29, name = "refObjectId",
		description = "Reference object id.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 759, tableId = 29, name = "isStar",
		description = "1 for star, 0 for galaxy.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 760, tableId = 29, name = "ra",
		description = "RA. ICRS.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 761, tableId = 29, name = "decl",
		description = "Decl. ICRS.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 762, tableId = 29, name = "gLat",
		description = "Galactic latitude, NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 763, tableId = 29, name = "gLon",
		description = "Galactic longitude. Null for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 764, tableId = 29, name = "sedName",
		description = "Best-fit SED name. Null for galaxies.",
		type = "CHAR(32)",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 765, tableId = 29, name = "uMag",
		description = "u band AB magnitude.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 766, tableId = 29, name = "gMag",
		description = "g band AB magnitude.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 767, tableId = 29, name = "rMag",
		description = "r band AB magnitude.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 768, tableId = 29, name = "iMag",
		description = "i band AB magnitude.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 769, tableId = 29, name = "zMag",
		description = "z band AB magnitude.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 770, tableId = 29, name = "yMag",
		description = "y band AB magnitude.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 771, tableId = 29, name = "muRa",
		description = "dRA/dt*cos(decl). NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "milliarcsec/year",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 772, tableId = 29, name = "muDecl",
		description = "dDec/dt. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "milliarcsec/year",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 773, tableId = 29, name = "parallax",
		description = "Parallal. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "milliarcsec",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 774, tableId = 29, name = "vRad",
		description = "Radial velocity. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "km/sec",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 775, tableId = 29, name = "isVar",
		description = "1 for variable stars, 0 for galaxies and non-variable stars.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 776, tableId = 29, name = "redshift",
		description = "Redshift. NULL for stars.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 777, tableId = 29, name = "uCov",
		description = "Number of u-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 778, tableId = 29, name = "gCov",
		description = "Number of g-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 779, tableId = 29, name = "rCov",
		description = "Number of r-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 780, tableId = 29, name = "iCov",
		description = "Number of i-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 781, tableId = 29, name = "zCov",
		description = "Number of z-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 782, tableId = 29, name = "yCov",
		description = "Number of y-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 25;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 30, name = "Snap_Ccd_To_Science_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 783, tableId = 30, name = "snapCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 784, tableId = 30, name = "snap",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 785, tableId = 30, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 31, name = "Source",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 786, tableId = 31, name = "sourceId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 787, tableId = 31, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 788, tableId = 31, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 789, tableId = 31, name = "objectId",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 790, tableId = 31, name = "movingObjectId",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 791, tableId = 31, name = "procHistoryId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 792, tableId = 31, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 793, tableId = 31, name = "raErrForDetection",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 794, tableId = 31, name = "raErrForWcs",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 795, tableId = 31, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 796, tableId = 31, name = "declErrForDetection",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 797, tableId = 31, name = "declErrForWcs",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 798, tableId = 31, name = "xFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 799, tableId = 31, name = "xFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 800, tableId = 31, name = "yFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 801, tableId = 31, name = "yFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 802, tableId = 31, name = "raFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 803, tableId = 31, name = "raFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 804, tableId = 31, name = "declFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 805, tableId = 31, name = "declFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 806, tableId = 31, name = "xPeak",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 807, tableId = 31, name = "yPeak",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 808, tableId = 31, name = "raPeak",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 809, tableId = 31, name = "declPeak",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 810, tableId = 31, name = "xAstrom",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 811, tableId = 31, name = "xAstromErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 812, tableId = 31, name = "yAstrom",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 813, tableId = 31, name = "yAstromErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 814, tableId = 31, name = "raAstrom",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 815, tableId = 31, name = "raAstromErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 816, tableId = 31, name = "declAstrom",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 817, tableId = 31, name = "declAstromErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 818, tableId = 31, name = "raObject",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 819, tableId = 31, name = "declObject",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 820, tableId = 31, name = "taiMidPoint",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 821, tableId = 31, name = "taiRange",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 822, tableId = 31, name = "psfFlux",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 823, tableId = 31, name = "psfFluxErr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 824, tableId = 31, name = "apFlux",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 825, tableId = 31, name = "apFluxErr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 826, tableId = 31, name = "modelFlux",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 827, tableId = 31, name = "modelFluxErr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 828, tableId = 31, name = "petroFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 829, tableId = 31, name = "petroFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 830, tableId = 31, name = "instFlux",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 831, tableId = 31, name = "instFluxErr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 832, tableId = 31, name = "nonGrayCorrFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 833, tableId = 31, name = "nonGrayCorrFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 834, tableId = 31, name = "atmCorrFlux",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 835, tableId = 31, name = "atmCorrFluxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 836, tableId = 31, name = "apDia",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 837, tableId = 31, name = "Ixx",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 838, tableId = 31, name = "IxxErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 839, tableId = 31, name = "Iyy",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 840, tableId = 31, name = "IyyErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 841, tableId = 31, name = "Ixy",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 842, tableId = 31, name = "IxyErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 843, tableId = 31, name = "snr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 844, tableId = 31, name = "chi2",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 845, tableId = 31, name = "sky",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 846, tableId = 31, name = "skyErr",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 847, tableId = 31, name = "extendedness",
		description = "Probability that this source is an extended source. Valid range: 0-1, where 1 indicates an extended source with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 848, tableId = 31, name = "flux_PS",
		description = "Calibrated flux for Point Source model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 849, tableId = 31, name = "flux_PS_Sigma",
		description = "Uncertainty of flux_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 850, tableId = 31, name = "flux_SG",
		description = "Calibrated flux for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 851, tableId = 31, name = "flux_SG_Sigma",
		description = "Uncertainty of flux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 852, tableId = 31, name = "sersicN_SG",
		description = "Sersi index for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 853, tableId = 31, name = "sersicN_SG_Sigma",
		description = "Uncertainty of sersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 854, tableId = 31, name = "e1_SG",
		description = "Ellipticity for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 855, tableId = 31, name = "e1_SG_Sigma",
		description = "Uncertainty of e1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 856, tableId = 31, name = "e2_SG",
		description = "Ellipticity for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 857, tableId = 31, name = "e2_SG_Sigma",
		description = "Uncertainty of e2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 858, tableId = 31, name = "radius_SG",
		description = "Size of Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 859, tableId = 31, name = "radius_SG_Sigma",
		description = "Uncertainty of radius_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 860, tableId = 31, name = "flux_flux_SG_Cov",
		description = "Covariance of flux and flux for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 861, tableId = 31, name = "flux_e1_SG_Cov",
		description = "Covariance of flux and e1 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 862, tableId = 31, name = "flux_e2_SG_Cov",
		description = "Covariance of flux and e2 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 863, tableId = 31, name = "flux_radius_SG_Cov",
		description = "Covariance of flux and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 864, tableId = 31, name = "flux_sersicN_SG_Cov",
		description = "Covariance of flux and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 865, tableId = 31, name = "e1_e1_SG_Cov",
		description = "Covariance of e1 and e1 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 866, tableId = 31, name = "e1_e2_SG_Cov",
		description = "Covariance of e1 and e2 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 867, tableId = 31, name = "e1_radius_SG_Cov",
		description = "Covariance of e1 and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 868, tableId = 31, name = "e1_sersicN_SG_Cov",
		description = "Covariance of e1 and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 83;

	INSERT INTO md_Column
	SET columnId = 869, tableId = 31, name = "e2_e2_SG_Cov",
		description = "Covariance of e2 and e2 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 84;

	INSERT INTO md_Column
	SET columnId = 870, tableId = 31, name = "e2_radius_SG_Cov",
		description = "Covariance of e2 and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 85;

	INSERT INTO md_Column
	SET columnId = 871, tableId = 31, name = "e2_sersicN_SG_Cov",
		description = "Covariance of e2 and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 86;

	INSERT INTO md_Column
	SET columnId = 872, tableId = 31, name = "radius_radius_SG_Cov",
		description = "Covariance of radius and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 87;

	INSERT INTO md_Column
	SET columnId = 873, tableId = 31, name = "radius_sersicN_SG_Cov",
		description = "Covariance of radius and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 88;

	INSERT INTO md_Column
	SET columnId = 874, tableId = 31, name = "sersicN_sersicN_SG_Cov",
		description = "Covariance for sersicN and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 89;

	INSERT INTO md_Column
	SET columnId = 875, tableId = 31, name = "flagForAssociation",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 90;

	INSERT INTO md_Column
	SET columnId = 876, tableId = 31, name = "flagForDetection",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 91;

	INSERT INTO md_Column
	SET columnId = 877, tableId = 31, name = "flagForWcs",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 92;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 32, name = "Source_pt2",
	engine = "MyISAM",
	description = "Table to store high signal-to-noise &quot;sources&quot;. A source is a measurement of  Object's properties from a single image that contains its footprint on the sky. This table is expected to be used in DC3b-pt2.&#xA;";

	INSERT INTO md_Column
	SET columnId = 878, tableId = 32, name = "sourceId",
		description = "Unique id.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 879, tableId = 32, name = "ccdExposureId",
		description = "Pointer to the CcdExpsoure where this source was measured. Note that we are allowing a source to belong to multiple AmpExposures, but it may not span multiple CcdExposures.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 880, tableId = 32, name = "filterId",
		description = "Pointer to an entry in Filter table: filter used to take Exposure where this Source was measured.&#xA;",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 881, tableId = 32, name = "objectId",
		description = "Pointer to Object table. Might be NULL (each Source will point to either MovingObject or Object)",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 882, tableId = 32, name = "movingObjectId",
		description = "Pointer to MovingObject table. Might be NULL (each Source will point to either MovingObject or Object)",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 883, tableId = 32, name = "ra",
		description = "RA-coordinate of the center of the source.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 884, tableId = 32, name = "raSigma",
		description = "Uncertainty of ra.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 885, tableId = 32, name = "decl",
		description = "Decl-coordinate of the center of the source.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 886, tableId = 32, name = "declSigma",
		description = "Uncertainty of decl.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 887, tableId = 32, name = "xAstrom",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 888, tableId = 32, name = "xAstromSigma",
		description = "Uncertainty of xAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 889, tableId = 32, name = "yAstrom",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using Dave Monet's algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 890, tableId = 32, name = "yAstromSigma",
		description = "Uncertainty of yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 891, tableId = 32, name = "xyAstromCov",
		description = "Covariance between the xAstrom and the yAstrom.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 892, tableId = 32, name = "xOther",
		description = "x position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 893, tableId = 32, name = "xOtherSigma",
		description = "Uncertainty of xOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 894, tableId = 32, name = "yOther",
		description = "y position computed by a centroiding algorithm for the purposes of astrometry using &quot;other&quot; centroiding algorithm.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 895, tableId = 32, name = "yOtherSigma",
		description = "Uncertainty of yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		unit = "degree",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 896, tableId = 32, name = "xyOtherCov",
		description = "Covariance between the xOther and yOther.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 897, tableId = 32, name = "astromRefrRa",
		description = "Astrometric refraction in ra.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 898, tableId = 32, name = "astromRefrRaSigma",
		description = "Uncertainty of astromRefrRa.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 899, tableId = 32, name = "astromRefrDecl",
		description = "Astrometric refraction in decl.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 900, tableId = 32, name = "astromRefrDeclSigma",
		description = "Uncertainty of astromRefrDecl.&#xA;",
		type = "FLOAT",
		notNull = 0,
		unit = "degree",
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 901, tableId = 32, name = "sky",
		description = "Sky background.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 902, tableId = 32, name = "skySigma",
		description = "Uncertainty of sky.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 903, tableId = 32, name = "psfLnL",
		description = "ln(likelihood) of being a PSF.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 904, tableId = 32, name = "lnL_SG",
		description = "Log-likelihood of being a Small Galaxy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 905, tableId = 32, name = "flux_PS",
		description = "Calibrated flux for Point Source model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 906, tableId = 32, name = "flux_PS_Sigma",
		description = "Uncertainty of flux_PS.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 907, tableId = 32, name = "flux_SG",
		description = "Calibrated flux for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 908, tableId = 32, name = "flux_SG_Sigma",
		description = "Uncertainty of flux_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 909, tableId = 32, name = "flux_CSG",
		description = "Calibrated flux for Cannonical Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 910, tableId = 32, name = "flux_CSG_Sigma",
		description = "Uncertainly of flux_CSG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 911, tableId = 32, name = "extendedness",
		description = "Probability that this source is an extended source. Valid range: 0-1, where 1 indicates an extended source with 100% probability.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 912, tableId = 32, name = "galExtinction",
		description = "Galactic extinction.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 913, tableId = 32, name = "sersicN_SG",
		description = "Sersic index for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 914, tableId = 32, name = "sersicN_SG_Sigma",
		description = "Uncertainty of sersicN_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 915, tableId = 32, name = "e1_SG",
		description = "Ellipticity for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 916, tableId = 32, name = "e1_SG_Sigma",
		description = "Uncertainty of e1_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 917, tableId = 32, name = "e2_SG",
		description = "Ellipticity for Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 918, tableId = 32, name = "e2_SG_Sigma",
		description = "Uncertainty of e2_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 919, tableId = 32, name = "radius_SG",
		description = "Size of Small Galaxy model.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 920, tableId = 32, name = "radius_SG_Sigma",
		description = "Uncertainty of radius_SG.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 921, tableId = 32, name = "midPoint",
		description = "Corrected midPoint of the exposure (tai).&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 922, tableId = 32, name = "apCorrection",
		description = "Photometric correction: aperture correction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 923, tableId = 32, name = "grayExtinction",
		description = "Photometric correction: gray extinction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 924, tableId = 32, name = "nonGrayExtinction",
		description = "Photometric correction: non gray extinction.&#xA;",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 925, tableId = 32, name = "momentIx",
		description = "Adaptive first moment. The moments are primarily for the moving objects, but should carry some information about defects, cosmics, etc. too.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 926, tableId = 32, name = "momentIxSigma",
		description = "Uncertainty of momentIx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 927, tableId = 32, name = "momentIy",
		description = "Adaptive first moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 928, tableId = 32, name = "momentIySigma",
		description = "Uncertainty of momentIy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 929, tableId = 32, name = "momentIxx",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 930, tableId = 32, name = "momentIxxSigma",
		description = "Uncertainty of momentIxx.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 931, tableId = 32, name = "momentIyy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 932, tableId = 32, name = "momentIyySigma",
		description = "Uncertainty of momentIyy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 933, tableId = 32, name = "momentIxy",
		description = "Adaptive second moment.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 934, tableId = 32, name = "momentIxySigma",
		description = "Uncertainty of momentIxy.&#xA;",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 935, tableId = 32, name = "flags",
		description = "Flags.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 936, tableId = 32, name = "_chunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 937, tableId = 32, name = "_subChunkId",
		description = "Internal column used by qserv.&#xA;",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 60;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 33, name = "Visit",
	engine = "MyISAM",
	description = "Defines a single Visit. 1 row per LSST visit.";

	INSERT INTO md_Column
	SET columnId = 938, tableId = 33, name = "visitId",
		description = "Unique identifier.&#xA;",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 34, name = "_MovingObjectToType",
	engine = "MyISAM",
	description = "Mapping: moving object --&amp;gt; types, with probabilities";

	INSERT INTO md_Column
	SET columnId = 939, tableId = 34, name = "movingObjectId",
		description = "Pointer to entry in MovingObject table",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 940, tableId = 34, name = "typeId",
		description = "Pointer to entry in ObjectType table",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 941, tableId = 34, name = "probability",
		description = "Probability that given MovingObject is of given type. Range: 0-100 (in%)",
		type = "TINYINT",
		notNull = 0,
		defaultValue = "100",
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 35, name = "_ObjectToType",
	engine = "MyISAM",
	description = "Mapping Object --&amp;gt; types, with probabilities";

	INSERT INTO md_Column
	SET columnId = 942, tableId = 35, name = "objectId",
		description = "Pointer to an entry in Object table",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 943, tableId = 35, name = "typeId",
		description = "Pointer to an entry in ObjectType table",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 944, tableId = 35, name = "probability",
		description = "Probability that given object is of given type. Range 0-100 %",
		type = "TINYINT",
		notNull = 0,
		defaultValue = "100",
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 36, name = "_Raw_Ccd_ExposureToVisit",
	engine = "MyISAM",
	description = "Mapping table: Raw_Ccd_Exposure --&amp;gt; visit&#xA;";

	INSERT INTO md_Column
	SET columnId = 945, tableId = 36, name = "visitId",
		description = "Pointer to entry in Visit table - visit that given Exposure belongs to.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 946, tableId = 36, name = "ccdExposureId",
		description = "Pointer to entry in Raw_Ccd_Exposure table.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 37, name = "_mops_Config",
	description = "Internal table used to ship runtime configuration data to MOPS worker nodes.&#xA;&#xA;This will eventually be replaced by some other mechanism. Note however that this data must be captured by the LSST software provenance tables.";

	INSERT INTO md_Column
	SET columnId = 947, tableId = 37, name = "configId",
		description = "Referring derived object",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 948, tableId = 37, name = "configText",
		description = "Config contents",
		type = "TEXT",
		notNull = 0,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 38, name = "_mops_EonQueue",
	description = "Internal table which maintains a queue of objects to be passed to the MOPS precovery pipeline.&#xA;&#xA;Will eventually be replaced by a different queueing mechanism.";

	INSERT INTO md_Column
	SET columnId = 949, tableId = 38, name = "movingObjectId",
		description = "Referring derived object",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 950, tableId = 38, name = "eventId",
		description = "Referring history event causing insertion",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 951, tableId = 38, name = "insertTime",
		description = "Wall clock time object was queued",
		type = "TIMESTAMP",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 952, tableId = 38, name = "status",
		description = "Processing status N =&amp;gt; new, I =&amp;gt; ID1 done, P =&amp;gt; precov done, X =&amp;gt; finished",
		type = "CHAR(1)",
		notNull = 0,
		defaultValue = "'I'",
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 39, name = "_mops_MoidQueue",
	description = "Internal table which maintain a queue of objects to be passed to the MOPS precovery pipeline.&#xA;&#xA;Will eventually be replaced by a different queueing mechanism.";

	INSERT INTO md_Column
	SET columnId = 953, tableId = 39, name = "movingObjectId",
		description = "Referring derived object",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 954, tableId = 39, name = "movingObjectVersion",
		description = "version of referring derived object",
		type = "INT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 955, tableId = 39, name = "eventId",
		description = "Referring history event causing insertion",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 956, tableId = 39, name = "insertTime",
		description = "Wall clock time object was queued",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 40, name = "_qservChunkMap",
	engine = "MyISAM",
	description = "Internal table used by qserv. Keeps spatial mapping ra/decl bounding box --&amp;gt; chunkId.&#xA;&#xA;";

	INSERT INTO md_Column
	SET columnId = 957, tableId = 40, name = "raMin",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 958, tableId = 40, name = "raMax",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 959, tableId = 40, name = "declMin",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 960, tableId = 40, name = "declMax",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 961, tableId = 40, name = "chunkId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 962, tableId = 40, name = "objCount",
		description = "Number of objects in a given chunk (for cost estimation).&#xA;",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 41, name = "_qservObjectIdMap",
	engine = "MyISAM",
	description = "Internal table used by qserv. Keeps mapping: objectId --&amp;gt; chunkId+subChunkId.&#xA;";

	INSERT INTO md_Column
	SET columnId = 963, tableId = 41, name = "objectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 964, tableId = 41, name = "chunkId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 965, tableId = 41, name = "subChunkId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 42, name = "_qservSubChunkMap",
	engine = "MyISAM",
	description = "Internal table used by qserv. Keeps spatial mapping ra/decl bounding box --&amp;gt; chunkId and subChunkId.&#xA;";

	INSERT INTO md_Column
	SET columnId = 966, tableId = 42, name = "raMin",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 967, tableId = 42, name = "raMax",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 968, tableId = 42, name = "declMin",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 969, tableId = 42, name = "declMax",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 970, tableId = 42, name = "chunkId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 971, tableId = 42, name = "subChunkId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 972, tableId = 42, name = "objCount",
		description = "Number of objects in a given subChunk (for cost estimation).&#xA;",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 7;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 43, name = "_tmpl_Id",
	engine = "MyISAM",
	description = "Template table. Schema for lists of ids (e.g. for Objects to delete)";

	INSERT INTO md_Column
	SET columnId = 973, tableId = 43, name = "id",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 44, name = "_tmpl_IdPair",
	engine = "MyISAM",
	description = "Template table. Schema for list of id pairs.";

	INSERT INTO md_Column
	SET columnId = 974, tableId = 44, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 975, tableId = 44, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 45, name = "_tmpl_MatchPair",
	engine = "MyISAM",
	description = "Template table. Schema for per-visit match result tables.";

	INSERT INTO md_Column
	SET columnId = 976, tableId = 45, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 977, tableId = 45, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 978, tableId = 45, name = "distance",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 46, name = "_tmpl_ap_DiaSourceToNewObject",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 979, tableId = 46, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 980, tableId = 46, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 981, tableId = 46, name = "visitId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 47, name = "_tmpl_ap_DiaSourceToObjectMatches",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 982, tableId = 47, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 983, tableId = 47, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 984, tableId = 47, name = "distance",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 985, tableId = 47, name = "visitId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 48, name = "_tmpl_ap_PredToDiaSourceMatches",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 986, tableId = 48, name = "first",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 987, tableId = 48, name = "second",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 988, tableId = 48, name = "distance",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 989, tableId = 48, name = "visitId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 49, name = "_tmpl_mops_Ephemeris",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 990, tableId = 49, name = "movingObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 991, tableId = 49, name = "movingObjectVersion",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 992, tableId = 49, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 993, tableId = 49, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 994, tableId = 49, name = "mjd",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 995, tableId = 49, name = "smia",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 996, tableId = 49, name = "smaa",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 997, tableId = 49, name = "pa",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 998, tableId = 49, name = "mag",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 9;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 50, name = "_tmpl_mops_Prediction",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 999, tableId = 50, name = "movingObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1000, tableId = 50, name = "movingObjectVersion",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1001, tableId = 50, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1002, tableId = 50, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1003, tableId = 50, name = "mjd",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1004, tableId = 50, name = "smia",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 1005, tableId = 50, name = "smaa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 1006, tableId = 50, name = "pa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 1007, tableId = 50, name = "mag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 1008, tableId = 50, name = "magErr",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 51, name = "mops_Event";

	INSERT INTO md_Column
	SET columnId = 1009, tableId = 51, name = "eventId",
		description = "Auto-generated internal event ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1010, tableId = 51, name = "procHistoryId",
		description = "Pointer to processing history (prv_ProcHistory)",
		type = "INT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1011, tableId = 51, name = "eventType",
		description = "Type of event (A)ttribution/(P)recovery/(D)erivation/(I)dentification/(R)emoval",
		type = "CHAR(1)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1012, tableId = 51, name = "eventTime",
		description = "Timestamp for event creation",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1013, tableId = 51, name = "movingObjectId",
		description = "Referring derived object ID",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1014, tableId = 51, name = "movingObjectVersion",
		description = "Pointer to resulting orbit",
		type = "INT",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 1015, tableId = 51, name = "orbitCode",
		description = "Information about computed orbit",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 1016, tableId = 51, name = "d3",
		description = "Computed 3-parameter D-criterion",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 1017, tableId = 51, name = "d4",
		description = "Computed 4-parameter D-criterion",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 1018, tableId = 51, name = "ccdExposureId",
		description = "Referring to Science_Ccd_Exposure id generating the event.&#xA;",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 1019, tableId = 51, name = "classification",
		description = "MOPS efficiency classification for event",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 1020, tableId = 51, name = "ssmId",
		description = "Matching SSM ID for clean classifications",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 12;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 52, name = "mops_Event_OrbitDerivation",
	description = "Table for associating tracklets with derivation events. There is a one to many relationship between events and tracklets (there will be multiple rows per event).";

	INSERT INTO md_Column
	SET columnId = 1021, tableId = 52, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1022, tableId = 52, name = "trackletId",
		description = "Associated tracklet ID (multiple rows per event)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 53, name = "mops_Event_OrbitIdentification",
	description = "Table for associating moving objects with identification events (one object per event). The original orbit and tracklets for the child can be obtained from the MOPS_History table by looking up the child object.";

	INSERT INTO md_Column
	SET columnId = 1023, tableId = 53, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1024, tableId = 53, name = "childObjectId",
		description = "Matching (child) derived object ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 54, name = "mops_Event_TrackletAttribution",
	description = "Table for associating tracklets with attribution events (one tracklet per event).";

	INSERT INTO md_Column
	SET columnId = 1025, tableId = 54, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1026, tableId = 54, name = "trackletId",
		description = "Attributed tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1027, tableId = 54, name = "ephemerisDistance",
		description = "Predicted position minus actual, arcsecs",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1028, tableId = 54, name = "ephemerisUncertainty",
		description = "Predicted error ellipse semi-major axis, arcsecs",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 55, name = "mops_Event_TrackletPrecovery",
	description = "Table for associating tracklets with precovery events (one precovery per event).";

	INSERT INTO md_Column
	SET columnId = 1029, tableId = 55, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1030, tableId = 55, name = "trackletId",
		description = "Precovered tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1031, tableId = 55, name = "ephemerisDistance",
		description = "Predicted position minus actual, arcsecs",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1032, tableId = 55, name = "ephemerisUncertainty",
		description = "Predicted error ellipse semi-major axis, arcsecs",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 56, name = "mops_Event_TrackletRemoval",
	description = "Table for associating tracklets with removal events (one removal per event).";

	INSERT INTO md_Column
	SET columnId = 1033, tableId = 56, name = "eventId",
		description = "Parent event ID (from mops_History table)",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1034, tableId = 56, name = "trackletId",
		description = "Removed tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 57, name = "mops_MovingObjectToTracklet",
	description = "Current membership of tracklets and moving objects.";

	INSERT INTO md_Column
	SET columnId = 1035, tableId = 57, name = "movingObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1036, tableId = 57, name = "trackletId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 58, name = "mops_SSM",
	description = "Table that contains synthetic solar system model (SSM) objects.";

	INSERT INTO md_Column
	SET columnId = 1037, tableId = 58, name = "ssmId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1038, tableId = 58, name = "ssmDescId",
		description = "Pointer to SSM description",
		type = "SMALLINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1039, tableId = 58, name = "q",
		description = "semi-major axis, AU",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1040, tableId = 58, name = "e",
		description = "eccentricity e (dimensionless)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1041, tableId = 58, name = "i",
		description = "inclination, deg",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1042, tableId = 58, name = "node",
		description = "longitude of ascending node, deg",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 1043, tableId = 58, name = "argPeri",
		description = "argument of perihelion, deg",
		type = "DOUBLE",
		notNull = 1,
		unit = "degree",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 1044, tableId = 58, name = "timePeri",
		description = "time of perihelion, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 1045, tableId = 58, name = "epoch",
		description = "epoch of osculating elements, MJD (UTC)",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 1046, tableId = 58, name = "h_v",
		description = "Absolute magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 1047, tableId = 58, name = "h_ss",
		description = "??",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 1048, tableId = 58, name = "g",
		description = "Slope parameter g, dimensionless",
		type = "DOUBLE",
		notNull = 0,
		unit = "-",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 1049, tableId = 58, name = "albedo",
		description = "Albedo, dimensionless",
		type = "DOUBLE",
		notNull = 0,
		unit = "-",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 1050, tableId = 58, name = "ssmObjectName",
		description = "MOPS synthetic object name",
		type = "VARCHAR(32)",
		notNull = 1,
		displayOrder = 14;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 59, name = "mops_SSMDesc",
	description = "Table containing object name prefixes and descriptions of synthetic solar system object types.";

	INSERT INTO md_Column
	SET columnId = 1051, tableId = 59, name = "ssmDescId",
		description = "Auto-generated row ID",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1052, tableId = 59, name = "prefix",
		description = "MOPS prefix code S0/S1/etc.",
		type = "CHAR(4)",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1053, tableId = 59, name = "description",
		description = "Long description",
		type = "VARCHAR(100)",
		notNull = 0,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 60, name = "mops_TrackToTracklet";

	INSERT INTO md_Column
	SET columnId = 1054, tableId = 60, name = "trackId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1055, tableId = 60, name = "trackletId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 61, name = "mops_Tracklet";

	INSERT INTO md_Column
	SET columnId = 1056, tableId = 61, name = "trackletId",
		description = "Auto-generated internal MOPS tracklet ID",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1057, tableId = 61, name = "ccdExposureId",
		description = "Terminating field ID - pointer to Science_Ccd_Exposure&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1058, tableId = 61, name = "procHistoryId",
		description = "Pointer to processing history (prv_ProcHistory)",
		type = "INT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1059, tableId = 61, name = "ssmId",
		description = "Matching SSM ID for clean classifications",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1060, tableId = 61, name = "velRa",
		description = "Average RA velocity deg/day, cos(dec) applied",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1061, tableId = 61, name = "velRaErr",
		description = "Uncertainty in RA velocity",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 1062, tableId = 61, name = "velDecl",
		description = "Average Dec velocity, deg/day)",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 1063, tableId = 61, name = "velDeclErr",
		description = "Uncertainty in Dec velocity",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 1064, tableId = 61, name = "velTot",
		description = "Average total velocity, deg/day",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 1065, tableId = 61, name = "accRa",
		description = "Average RA Acceleration, deg/day^2",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 1066, tableId = 61, name = "accRaErr",
		description = "Uncertainty in RA acceleration",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 1067, tableId = 61, name = "accDecl",
		description = "Average Dec Acceleration, deg/day^2",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 1068, tableId = 61, name = "accDeclErr",
		description = "Uncertainty in Dec acceleration",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree/day^2",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 1069, tableId = 61, name = "extEpoch",
		description = "Extrapolated (central) epoch, MJD (UTC)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 1070, tableId = 61, name = "extRa",
		description = "Extrapolated (central) RA, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 1071, tableId = 61, name = "extRaErr",
		description = "Uncertainty in extrapolated RA, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 1072, tableId = 61, name = "extDecl",
		description = "Extrapolated (central) Dec, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 1073, tableId = 61, name = "extDeclErr",
		description = "Uncertainty in extrapolated Dec, deg",
		type = "DOUBLE",
		notNull = 0,
		unit = "degree",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 1074, tableId = 61, name = "extMag",
		description = "Extrapolated (central) magnitude",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 1075, tableId = 61, name = "extMagErr",
		description = "Uncertainty in extrapolated mag, deg",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 1076, tableId = 61, name = "probability",
		description = "Likelihood tracklet is real (unused currently)",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 1077, tableId = 61, name = "status",
		description = "processing status (unfound 'X', unattributed 'U', attributed 'A')",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 1078, tableId = 61, name = "classification",
		description = "MOPS efficiency classification",
		type = "CHAR(1)",
		notNull = 0,
		displayOrder = 23;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 62, name = "mops_TrackletToDiaSource",
	description = "Table maintaining many-to-many relationship between tracklets and detections.&#xA;";

	INSERT INTO md_Column
	SET columnId = 1079, tableId = 62, name = "trackletId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1080, tableId = 62, name = "diaSourceId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 63, name = "prv_Activity",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1081, tableId = 63, name = "activityId",
		description = "Unique id derived from prv_Run.offset.&#xA;",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1082, tableId = 63, name = "offset",
		description = "Corresponding prv_Run offset.&#xA;",
		type = "MEDIUMINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1083, tableId = 63, name = "name",
		description = "A name for the activity.&#xA;",
		type = "VARCHAR(64)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1084, tableId = 63, name = "type",
		description = "A name indicating type of activity, e.g. &quot;launch&quot;, &quot;workflow&quot;.&#xA;",
		type = "VARCHAR(64)",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1085, tableId = 63, name = "platform",
		description = "Name of the platform where the activity occurred (does not need to a be a DNS name).&#xA;",
		type = "VARCHAR(64)",
		notNull = 1,
		displayOrder = 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 64, name = "prv_Filter",
	engine = "MyISAM",
	description = "One row per color - the table will have 6 rows";

	INSERT INTO md_Column
	SET columnId = 1086, tableId = 64, name = "filterId",
		description = "Unique id.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1087, tableId = 64, name = "focalPlaneId",
		description = "Pointer to FocalPlane - focal plane this filter belongs to.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1088, tableId = 64, name = "name",
		description = "String description of the filter,e.g. 'VR SuperMacho c6027'.",
		type = "VARCHAR(80)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1089, tableId = 64, name = "url",
		description = "URL for filter transmission curve. (Added from archive specs for LSST precursor data).",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1090, tableId = 64, name = "clam",
		description = "Filter centroid wavelength (Angstroms). (Added from archive specs for LSST precursor data).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1091, tableId = 64, name = "bw",
		description = "Filter effective bandwidth (Angstroms). (Added from archive specs for LSST precursor data).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 65, name = "prv_PolicyFile",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1092, tableId = 65, name = "policyFileId",
		description = "Identifier for the file containing the Policy.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1093, tableId = 65, name = "pathName",
		description = "Path to the Policy file.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1094, tableId = 65, name = "hashValue",
		description = "MD5 hash of the Policy file contents for verification and modification detection.",
		type = "CHAR(32)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1095, tableId = 65, name = "modifiedDate",
		description = "Time of last modification of the Policy file as provided by the filesystem.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 66, name = "prv_PolicyKey",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1096, tableId = 66, name = "policyKeyId",
		description = "Identifier for a key within a Policy file.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1097, tableId = 66, name = "policyFileId",
		description = "Identifier for the Policy file.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1098, tableId = 66, name = "keyName",
		description = "Name of the key in the Policy file.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1099, tableId = 66, name = "keyType",
		description = "Type of the key in the Policy file.",
		type = "VARCHAR(16)",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 67, name = "prv_Run",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1100, tableId = 67, name = "offset",
		type = "MEDIUMINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1101, tableId = 67, name = "runId",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 68, name = "prv_SoftwarePackage",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1102, tableId = 68, name = "packageId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1103, tableId = 68, name = "packageName",
		type = "VARCHAR(64)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 69, name = "prv_cnf_PolicyKey",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1104, tableId = 69, name = "policyKeyId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1105, tableId = 69, name = "value",
		type = "TEXT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1106, tableId = 69, name = "validityBegin",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1107, tableId = 69, name = "validityEnd",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 70, name = "prv_cnf_SoftwarePackage",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1108, tableId = 70, name = "packageId",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1109, tableId = 70, name = "version",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1110, tableId = 70, name = "directory",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1111, tableId = 70, name = "validityBegin",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1112, tableId = 70, name = "validityEnd",
		type = "DATETIME",
		notNull = 0,
		displayOrder = 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 71, name = "sdqa_ImageStatus",
	engine = "MyISAM",
	description = "Unique set of status names and their definitions, e.g. &quot;passed&quot;, &quot;failed&quot;, etc. ";

	INSERT INTO md_Column
	SET columnId = 1113, tableId = 71, name = "sdqa_imageStatusId",
		description = "Primary key",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1114, tableId = 71, name = "statusName",
		description = "One-word, camel-case, descriptive name of a possible image status (e.g., passedAuto, marginallyPassedManual, etc.)",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1115, tableId = 71, name = "definition",
		description = "Detailed Definition of the image status",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 72, name = "sdqa_Metric",
	engine = "MyISAM",
	description = "Unique set of metric names and associated metadata (e.g., &quot;nDeadPix&quot;, &quot;median&quot;, etc.). There will be approximately 30 records total in this table.";

	INSERT INTO md_Column
	SET columnId = 1116, tableId = 72, name = "sdqa_metricId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1117, tableId = 72, name = "metricName",
		description = "One-word, camel-case, descriptive name of a possible metric (e.g., mSatPix, median, etc).",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1118, tableId = 72, name = "physicalUnits",
		description = "Physical units of metric.",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1119, tableId = 72, name = "dataType",
		description = "Flag indicating whether data type of the metric value is integer (0) or float (1)",
		type = "CHAR(1)",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1120, tableId = 72, name = "definition",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 73, name = "sdqa_Rating_ForScienceAmpExposure",
	engine = "MyISAM",
	description = "Various SDQA ratings for a given amplifier image. There will approximately 30 of these records per image record.";

	INSERT INTO md_Column
	SET columnId = 1121, tableId = 73, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1122, tableId = 73, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1123, tableId = 73, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1124, tableId = 73, name = "ampExposureId",
		description = "Pointer to Science_Amp_Exposure.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1125, tableId = 73, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1126, tableId = 73, name = "metricSigma",
		description = "Uncertainty of the value of this metric.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 74, name = "sdqa_Rating_ForScienceCcdExposure",
	engine = "MyISAM",
	description = "Various SDQA ratings for a given ScienceCcdExposure.&#xA;";

	INSERT INTO md_Column
	SET columnId = 1127, tableId = 74, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1128, tableId = 74, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1129, tableId = 74, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1130, tableId = 74, name = "ccdExposureId",
		description = "Pointer to Science_Ccd_Exposure.&#xA;",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1131, tableId = 74, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1132, tableId = 74, name = "metricSigma",
		description = "Uncertainty of the value of this metric.&#xA;",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 75, name = "sdqa_Rating_ForSnapCcdExposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1133, tableId = 75, name = "sdqa_ratingId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1134, tableId = 75, name = "sdqa_metricId",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1135, tableId = 75, name = "sdqa_thresholdId",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1136, tableId = 75, name = "ccdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1137, tableId = 75, name = "metricValue",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1138, tableId = 75, name = "metricSigma",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 76, name = "sdqa_Threshold",
	engine = "MyISAM",
	description = "Version-controlled metric thresholds. Total number of these records is approximately equal to 30 x the number of times the thresholds will be changed over the entire period of LSST operations (of ordre of 100), with most of the changes occuring in the first year of operations.";

	INSERT INTO md_Column
	SET columnId = 1139, tableId = 76, name = "sdqa_thresholdId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1140, tableId = 76, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric table.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1141, tableId = 76, name = "upperThreshold",
		description = "Threshold for which a metric value is tested to be greater than.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1142, tableId = 76, name = "lowerThreshold",
		description = "Threshold for which a metric value is tested to be less than.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1143, tableId = 76, name = "createdDate",
		description = "Database timestamp when the record is inserted.",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 5;


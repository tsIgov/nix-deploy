{ pkgs }:

pkgs.stdenv.mkDerivation {
	pname = "deploy-system";
	version = "1.0";
	src = ./..;

	buildInputs = with pkgs; [ age gh makeWrapper ];

	installPhase = ''
		mkdir -p $out/bin
		cp $src/system/deploy-system.sh $out/bin/deploy-system
		chmod +x $out/bin/deploy-system
		cp $src/pat.age $out/pat.age
	'';

	postFixup = ''
		wrapProgram $out/bin/deploy-system \
			--set PAT_DIR $out \
			--prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.age pkgs.gh ]}
		'';
}
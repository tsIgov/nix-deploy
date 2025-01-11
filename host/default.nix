{ pkgs }:

pkgs.stdenv.mkDerivation {
	pname = "deploy-host";
	version = "1.0";
	src = ./..;

	buildInputs = with pkgs; [ age gh makeWrapper ];

	installPhase = ''
		mkdir -p $out/bin
		cp $src/host/deploy-host.sh $out/bin/deploy-host
		chmod +x $out/bin/deploy-host
		cp $src/pat.age $out/pat.age
	'';

	postFixup = ''
		wrapProgram $out/bin/deploy-host \
			--set PAT_DIR $out \
			--prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.age pkgs.gh ]}
		'';
}
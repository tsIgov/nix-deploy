{ pkgs }:

pkgs.stdenv.mkDerivation {
	pname = "deploy-user";
	version = "1.0";
	src = ./..;

	buildInputs = with pkgs; [ age gh makeWrapper ];

	installPhase = ''
		mkdir -p $out/bin
		cp $src/user/deploy-user.sh $out/bin/deploy-user
		chmod +x $out/bin/deploy-user
		cp $src/pat.age $out/pat.age
	'';

	postFixup = ''
		wrapProgram $out/bin/deploy-user \
			--set PAT_DIR $out \
			--prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.age pkgs.gh ]}
		'';
}
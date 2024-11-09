// importation de la bibliotheque dart:io pour les entrées et sorties
import 'dart:io';

class Matiere {
  String nom;
  double notePartielle;
  double noteFinale;

  // Constructeur pour initialiser les propriétés
  Matiere(this.nom, this.notePartielle, this.noteFinale);

  // Méthode pour calculer la moyenne dans cette matière
  double calculerMoyenne() {
    return (notePartielle + noteFinale) / 2;
  }
}

class Etudiant {
  String nom;
  String filiere;
  List<Matiere> matieres = [];

  // Constructeur pour initialiser les propriétés
  Etudiant(this.nom, this.filiere);

  // Méthode pour ajouter une matière
  void ajouterMatiere(Matiere matiere) {
    matieres.add(matiere);
  }

  // Méthode pour calculer la moyenne générale
  double calculerMoyenneGenerale() {
    double sommeMoyennes = 0;
    for (var matiere in matieres) {
      sommeMoyennes += matiere.calculerMoyenne();
    }
    return sommeMoyennes / matieres.length;
  }

  // Méthode pour afficher le bulletin de notes
  void afficherBulletin() {
    print("\n====================================================");
    print("                      RELEVE DE NOTES                      ");
    print("====================================================");
    print(" Étudiant : $nom");
    print(" Filière : $filiere\n");

    // Affichage de l'en-tête du tableau
    print("----------------------------------------------------");
    print("| Matières                  | Note Partielle | Note Finale | Moyenne |");
    print("----------------------------------------------------");

    for (var matiere in matieres) {
      double moyenne = matiere.calculerMoyenne();
      print("| ${matiere.nom.padRight(24)} | ${matiere.notePartielle.toStringAsFixed(2).padLeft(13)} | ${matiere.noteFinale.toStringAsFixed(2).padLeft(11)} | ${moyenne.toStringAsFixed(2).padLeft(7)} |");
    }

    print("----------------------------------------------------");
    print(" Moyenne générale de l'étudiant : ${calculerMoyenneGenerale().toStringAsFixed(2)}");
    print("====================================================");
  }
}

void main() {
  // Création de l'étudiant
  Etudiant etudiant = Etudiant("SAVAS Sargun", "SRC");

  // Saisie des matières et des notes
  List<String> nomsMatieres = ["Maths", "SVT", "Physique"];

  for (var nomMatiere in nomsMatieres) {
    stdout.write("Entrez la note partielle pour $nomMatiere : ");
    double notePartielle = double.parse(stdin.readLineSync()!);
    stdout.write("Entrez la note finale pour $nomMatiere : ");
    double noteFinale = double.parse(stdin.readLineSync()!);

    // Ajouter la matière avec ses notes dans la liste de l'étudiant
    Matiere matiere = Matiere(nomMatiere, notePartielle, noteFinale);
    etudiant.ajouterMatiere(matiere);
  }

  // Afficher le bulletin de l'étudiant
  etudiant.afficherBulletin();
}
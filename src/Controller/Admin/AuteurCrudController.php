<?php

namespace App\Controller\Admin;

use App\Entity\Auteur;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class AuteurCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Auteur::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
